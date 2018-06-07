package koing.kosta180.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "koing.kosta180.mapper.StoreMapper";

	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getTime");
	}

	@Override
	public List<StoreVO> locationStoreList(String s_location_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".locationStoreList",s_location_no);
	}

	/*@Override
	public List<StoreVO> categoryStoreList(String s_category) {
		// TODO Auto-generated method stub  
		return sqlSession.selectList(namespace+".categoryStoreList");
	}*/
	
}
