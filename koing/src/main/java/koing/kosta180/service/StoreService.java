package koing.kosta180.service;

import java.util.List;

import koing.kosta180.domain.LocationStoreVO;
import koing.kosta180.domain.StoreVO;

public interface StoreService {

	//지역별 매장리스트 가져오기
	public LocationStoreVO locationStoreList() throws Exception;
	
	//카테고리별 매장리스트 가져오기
	public List<StoreVO> categoryStoreList(StoreVO store) throws Exception;

}
