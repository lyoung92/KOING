package koing.kosta180.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;

@Repository
public class RecommendDAOImpl implements RecommendDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "koing.kosta180.mapper.recommendMapper";

	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getTime");
	}

	@Override
	public List<StoreVO> mostLikeStoreList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mostLikeStoreList");
	}

	@Override
	public List<StoreVO> mostReserveStore(MemberVO member) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mostReserveStore",member.getId());
	}

	@Override
	public List<StoreVO> highScoreStore(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".highScoreStore",map);
	}

	@Override
	public List<StoreVO> likeItStore(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".likeItStore",map);
	}

	@Override
	public String joinStoreId(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".joinStoreId",id);
	}

	@Override
	public List<CategoryScoreVO> categoryScore(List<String> list) {
		// TODO Auto-generated method stub
		if(list == null){
			return sqlSession.selectList(namespace+".allCategoryScore");
		}else{
			return sqlSession.selectList(namespace+".categoryScore", list);			
		}
	}

	@Override
	public StoreVO getStore(String s_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getStore", s_no);
	}

	@Override
	public CategoryScoreVO getCategoryScore(String s_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getCategoryScore", s_no);
	}
	
	
	
	
	
	
	
	
	
}
