package koing.kosta180.persistence;

import java.util.HashMap;
import java.util.List;

import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;

public interface RecommendDAO {
	public String getTime();
	public List<StoreVO> mostLikeStoreList();
	public List<StoreVO> mostReserveStore(MemberVO member);
	public List<StoreVO> highScoreStore(HashMap<String, Object> map);
	public List<StoreVO> likeItStore(HashMap<String, Object> map);
	
	public String joinStoreId(String id);
	public List<CategoryScoreVO> categoryScore(List<String> list);
	public StoreVO getStore(String s_no);
	public CategoryScoreVO getCategoryScore(String s_no);
}
