package koing.kosta180.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import koing.kosta180.controller.MainController;
import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;
import koing.kosta180.persistence.RecommendDAO;

@Service
public class RecommendServiceImpl implements RecommendService {

	private static double residual = 0.000001;
	
	@Inject
	private RecommendDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	//좋아요가 많은 상점(비회원 or 활동정보가 없는 회원)
	@Override
	public List<StoreVO> mostLikeStoreList() throws Exception {
		List<StoreVO> mostLikeStoreList = dao.mostLikeStoreList();
		return mostLikeStoreList;
	}

	//선호상점 
	@Override
	public StoreVO preferredStore(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		logger.info("preferredStore........................");
		StoreVO preferredStore = new StoreVO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = member.getId();
		
		// 1순위 예약횟수
		List<StoreVO> mostReserveStore = dao.mostReserveStore(member);
		
		if (isSingle(mostReserveStore)) {
			preferredStore = mostReserveStore.get(0);
		}else {
			map.put("id", id);
			map.put("mostReserveStore", mostReserveStore);
			
			//2순위 평점
			List<StoreVO> highScoreStore =  dao.highScoreStore(map);
			
			//예약 중 평점을 준 적이 없을 경우
			if(highScoreStore.isEmpty()){
				highScoreStore = mostReserveStore;
			}
			
			if(isSingle(highScoreStore)){
				preferredStore = highScoreStore.get(0);
			}else{
				map.put("highScoreStore",highScoreStore);
				
				//3순위 좋아요
				List<StoreVO> likeItStore = dao.likeItStore(map);
				
				//좋아요가 없을 경우
				if(likeItStore.isEmpty()){
					likeItStore = highScoreStore;
				}
				
				if(isSingle(likeItStore)){
					preferredStore = likeItStore.get(0);
				}else{
					
					//회원가입시 선택한 상점의 id가져오는 쿼리
					String joinStoreId = dao.joinStoreId(id);
					
					//위의 String 상점id를 List로 변환
					List<String> joinStoreList = new ArrayList<String>();
					if(joinStoreId == null){
						joinStoreList.add("");
					}else{	
						joinStoreList = Arrays.asList(joinStoreId.split(","));
					}
					
					//회원가입시 선택한 상점의 카테고리 리스트(joinStoreCategoryList)
					List<CategoryScoreVO> joinStoreCategoryList = dao.categoryScore(joinStoreList);
						
				
					//3순위까지 걸러진 상점의 카테고리 리스트(likeItStoreCategoryList)
					List<String> likeItStoreList = new ArrayList<>();
					for(int i=0; i<likeItStore.size();i++){
						likeItStoreList.add(i,likeItStore.get(i).getS_no());
					}
					List<CategoryScoreVO> likeItStoreCategoryList = dao.categoryScore(likeItStoreList);
					
					HashMap<String, Double> corrMap = new HashMap<String,Double>();
					
					for(int i=0; i<likeItStoreCategoryList.size(); i++){
						String key = likeItStoreCategoryList.get(i).getS_no();
						double value = 0;
						int j;
						for(j=0; j<joinStoreCategoryList.size();j++){
							value = value + correlation(likeItStoreCategoryList.get(i), joinStoreCategoryList.get(j));
						}
						value = value / j;
						corrMap.put(key, value);
					}
					
					//HashMap에 저장된 연관성의 최대값을 가지는 상점번호를 가져옴
					List<String> MaxStoreNoList = new ArrayList<String>();
					double maxValueInMap=(Collections.max(corrMap.values()));  // This will return max value in the Hashmap
			        for (Entry<String, Double> entry : corrMap.entrySet()) {  // Itrate through hashmap
			            if (entry.getValue()==maxValueInMap) {
			            	MaxStoreNoList.add(entry.getKey());
			                //System.out.println(entry.getKey());     // Print the key with max value
			            }
			        }
			        
			        String perferredStoreId = "";
			        if(MaxStoreNoList.isEmpty()){
			        	
			        }else if(MaxStoreNoList.size()>1){
			        	int random = randomRange(0, MaxStoreNoList.size()-1);
			        	perferredStoreId = MaxStoreNoList.get(random);
			        }else{
			        	perferredStoreId = MaxStoreNoList.get(0);
			        }
			        preferredStore = dao.getStore(perferredStoreId);
				}
			}
		}
		return preferredStore;
	}


	@Override
	public List<StoreVO> recommendStoreList(StoreVO preferredStore) throws Exception {
		// TODO Auto-generated method stub
		logger.info("recommendStoreList........................");
		
		List<CategoryScoreVO> allCategoryList =  dao.categoryScore(null);																		//상점 전체의 카테고리
		CategoryScoreVO preferredStoreCategory = dao.getCategoryScore(preferredStore.getS_no());						//선호 상점 한개의 카테고리
		
		HashMap<String, Double> corrMap =new HashMap<String,Double>();
		
		for(int i=0; i < allCategoryList.size(); i++){
			if(allCategoryList.get(i).getS_no().equals(preferredStoreCategory.getS_no())){
				continue;
			}
			double value = correlation(allCategoryList.get(i), preferredStoreCategory);
			String key = allCategoryList.get(i).getS_no();
			corrMap.put(key, value);
		}
		
		Iterator<String> it = sortByValue(corrMap).iterator();
		
        logger.info("---------sort 후------------");
        
       List<String> sortMapKeyList = new ArrayList<String>();
        
        while(it.hasNext()){
        	String temp =  it.next();
        	sortMapKeyList.add(temp);
            
        	logger.info(temp + " = " + corrMap.get(temp));
        }
        
        List<StoreVO> recommendStoreList = new ArrayList<StoreVO>();
        
        int biggerCount = 0;
        int sameIndex = 0;
        for(int i=0; i<sortMapKeyList.size(); i++){
        	if(corrMap.get(sortMapKeyList.get(i))>corrMap.get(sortMapKeyList.get(2))){
        		biggerCount++;
        	}else if(Math.abs(corrMap.get(sortMapKeyList.get(i))-corrMap.get(sortMapKeyList.get(2)))<residual){
        		sameIndex = i;
        	}
        }
        
        
        logger.info("biggerCount : " + biggerCount);
        logger.info("sameIndex : "+sameIndex);
        int index = -1;
        int index2 = -1;
        int index3 = -1;
       
        if(biggerCount == 0){
        	//random 3개
        	index = randomRange(biggerCount,sameIndex);
        	do {
				index2 = randomRange(biggerCount, sameIndex);
			} while (index2==index);
        	
        	do {
				index3 = randomRange(biggerCount, sameIndex);
			} while (index3==index2 || index3==index);
        	
        }else if(biggerCount==1){
        	//random 2개
        	index = 0;
        	index2 =  randomRange(biggerCount, sameIndex);
        	do {
				index3 = randomRange(biggerCount, sameIndex);
			} while (index3==index2);
        	
        }else if(biggerCount==2){
        	//random 1개
        	index = 0;
        	index2=1;
        	index3 = randomRange(biggerCount, sameIndex);
        }
        
        logger.info("1 : "+index);
        logger.info("2 : "+index2);
        logger.info("3 : "+index3);
        
        recommendStoreList.add(dao.getStore(sortMapKeyList.get(index)));
        recommendStoreList.add(dao.getStore(sortMapKeyList.get(index2)));
        recommendStoreList.add(dao.getStore(sortMapKeyList.get(index3)));

		return recommendStoreList;
	}



	// Map 정렬 메소드
	public static List<String> sortByValue(final Map<String, Double> map) {
		List<String> list = new ArrayList<String>();
		list.addAll(map.keySet());
		Collections.sort(list, new Comparator<Object>() {

			@SuppressWarnings("unchecked")
			public int compare(Object o1, Object o2) {
				Object v1 = map.get(o1);
				Object v2 = map.get(o2);

				return ((Comparable<Object>) v1).compareTo(v2);
			}
		});
		Collections.reverse(list); // 주석시 오름차순
		return list;
	}

	//리스트에 1개의 객체가 있는지 확인하는 메소드
	public boolean isSingle(List<StoreVO> likeItStore){
		if(likeItStore.size() == 1){
			return true;
		}else{
			return false;
		}
	}
	
	//Random 메소드
	public static int randomRange(int n1, int n2) {
	    return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	  }
	
	//2개의 StoreVO객체의 유사도를 구하는 메소드
	public double correlation(CategoryScoreVO joinCategory, CategoryScoreVO likeCategory){
		
		List<Integer> minus = new ArrayList<>();
		
		//주류
		minus.add( joinCategory.getAlc_beer() - likeCategory.getAlc_beer());
		minus.add(joinCategory.getAlc_cocktail()-likeCategory.getAlc_cocktail());
		minus.add(joinCategory.getAlc_etc()-likeCategory.getAlc_etc());
		minus.add(joinCategory.getAlc_ricewine()-likeCategory.getAlc_ricewine());
		minus.add(joinCategory.getAlc_soju()-likeCategory.getAlc_soju());
		minus.add(joinCategory.getAlc_vodka()-likeCategory.getAlc_vodka());
		minus.add(joinCategory.getAlc_wine()-likeCategory.getAlc_wine());
		
		//아시아식
		minus.add(joinCategory.getAsia_etc()-likeCategory.getAsia_etc());
		minus.add(joinCategory.getAsia_india()-likeCategory.getAsia_india());
		minus.add(joinCategory.getAsia_thai()-likeCategory.getAsia_thai());
		minus.add(joinCategory.getAsia_vietnam()-likeCategory.getAsia_vietnam());
		
		//중식
		minus.add(joinCategory.getChn_etc()-likeCategory.getChn_etc());
		minus.add(joinCategory.getChn_fry()-likeCategory.getChn_fry());
		minus.add(joinCategory.getChn_meat()-likeCategory.getChn_meat());
		minus.add(joinCategory.getChn_noodle()-likeCategory.getChn_noodle());
		minus.add(joinCategory.getChn_skewer()-likeCategory.getChn_skewer());
		minus.add(joinCategory.getChn_snack()-likeCategory.getChn_snack());
		minus.add(joinCategory.getChn_soup()-likeCategory.getChn_soup());
		
		//일식
		minus.add(joinCategory.getJap_etc()-likeCategory.getJap_etc());
		minus.add(joinCategory.getJap_meat()-likeCategory.getJap_meat());
		minus.add(joinCategory.getJap_noodle()-likeCategory.getJap_noodle());
		minus.add(joinCategory.getJap_rice()-likeCategory.getJap_rice());
		minus.add(joinCategory.getJap_snack()-likeCategory.getJap_snack());
		minus.add(joinCategory.getJap_soup()-likeCategory.getJap_soup());
		minus.add(joinCategory.getJap_sushi()-likeCategory.getJap_sushi());
		
		//한식
		minus.add(joinCategory.getKor_etc()-likeCategory.getKor_etc());
		minus.add(joinCategory.getKor_jjigae()-likeCategory.getKor_jjigae());
		minus.add(joinCategory.getKor_jjim()-likeCategory.getKor_jjim());
		minus.add(joinCategory.getKor_meat()-likeCategory.getKor_meat());
		minus.add(joinCategory.getKor_noodle()-likeCategory.getKor_noodle());
		minus.add(joinCategory.getKor_snack()-likeCategory.getKor_snack());
		minus.add(joinCategory.getKor_soup()-likeCategory.getKor_soup());
		
		//양식
		minus.add(joinCategory.getWes_etc()-likeCategory.getWes_etc());
		minus.add(joinCategory.getWes_meat()-likeCategory.getWes_meat());
		minus.add(joinCategory.getWes_noodle()-likeCategory.getWes_noodle());
		minus.add(joinCategory.getWes_pizza()-likeCategory.getWes_pizza());
		minus.add(joinCategory.getWes_roast()-likeCategory.getWes_roast());
		minus.add(joinCategory.getWes_skewer()-likeCategory.getWes_skewer());
		minus.add(joinCategory.getWes_snack()-likeCategory.getWes_snack());
		
		
		//각각의 차이를 제곱
		List<Double> pow = new ArrayList<Double>();
		for(int i=0; i<minus.size(); i++){
			pow.add(i, Math.pow(minus.get(i), 2));
		}
		
		double result = 0;
		
		//차이의 제곱의 합
		for(int i=0; i<pow.size();i++){
			result += pow.get(i);
		}
		
		//제곱의 합의 루트 + 1 의 역수 => 유사도
		result =1 /(1 + Math.sqrt(result));
		
		return result;
	}
	
}
