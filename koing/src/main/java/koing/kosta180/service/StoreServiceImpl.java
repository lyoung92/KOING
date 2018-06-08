package koing.kosta180.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import koing.kosta180.domain.LocationStoreVO;
import koing.kosta180.domain.StoreVO;
import koing.kosta180.persistence.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Inject
	private StoreDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreServiceImpl.class);

	//지역별 상점 가져오기
	@Override
	public LocationStoreVO locationStoreList() throws Exception {
		// TODO Auto-generated method stub
		LocationStoreVO locationStoreVO = new LocationStoreVO();
		
		locationStoreVO.setSeoulList(dao.locationStoreList("02"));					// 서울 지역번호 02를 가지고 서울의 상점을 리스트에 담음
		locationStoreVO.setIncheonList(dao.locationStoreList("032"));			// 인천 지역번호 032를 가지고 인천의 상점을 리스트에 담음
		locationStoreVO.setGyeonggiList(dao.locationStoreList("031"));        // 경기 지역번호 031을 가지고 경기의 상점을 리스트에 담음
		
		return locationStoreVO;
	}

	/*@Override
	public List<StoreVO> categoryStoreList(StoreVO store) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/
	
	@Override
	public void insertStore(StoreVO store) throws Exception {
		// TODO Auto-generated method stub
		dao.insertStore(store);
		
		String files[] = store.getS_files();
		
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			dao.addFile(fileName);
		}
		System.out.println("storeService insert 吏꾩엯");
	}

	@Override
	public StoreVO detailStore(String s_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.detailStore(s_no);
	}

	@Override
	public void updateStore(StoreVO store) throws Exception {
		// TODO Auto-generated method stub
		dao.updateStrore(store);
	}

	@Override
	public void deleteStore(String s_no) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteStore(s_no);
	}

	@Override
	public List<StoreVO> listStore(String s_category) throws Exception {
		// TODO Auto-generated method stub
		return dao.listStore(s_category);
	}

	
}
