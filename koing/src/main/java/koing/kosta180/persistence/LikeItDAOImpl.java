package koing.kosta180.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.LikeItVO;
import koing.kosta180.domain.MemberVO;

@Repository
public class LikeItDAOImpl implements LikeItDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "koing.kosta180.mapper.LikeItMapper";

	@Override
	public void insertLikeIt(LikeItVO likeIt) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertLikeIt",likeIt);
	}
	
	

}
