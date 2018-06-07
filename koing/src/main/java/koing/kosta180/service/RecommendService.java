package koing.kosta180.service;

import java.util.List;

import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;

public interface RecommendService {

	//좋아요 많은 상점ID 3개 가져오기
	public List<StoreVO> mostLikeStoreList() throws Exception;
	public StoreVO preferredStore(MemberVO member) throws Exception; 
	public List<StoreVO> recommendStoreList(StoreVO preferredStore)throws Exception;
}
