package koing.kosta180.service;

import java.util.List;

import koing.kosta180.domain.LocationStoreVO;
import koing.kosta180.domain.StoreVO;

public interface StoreService {

	public void insertStore(StoreVO vo) throws Exception;

	public StoreVO detailStore(String s_no) throws Exception;

	public void updateStore(StoreVO store) throws Exception;

	public void deleteStore(String s_no) throws Exception;

	public List<StoreVO> listStore(String s_category) throws Exception;

	// 지역별 매장리스트 가져오기
	public LocationStoreVO locationStoreList() throws Exception;

	// 카테고리별 매장리스트 가져오기
	//public List<StoreVO> categoryStoreList(StoreVO store) throws Exception;

}
