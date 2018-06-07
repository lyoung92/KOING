package koing.kosta180.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "koing.kosta180.mapper.MemberMapper";

	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getTime");
	}

	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertMember", member);
	}

	@Override
	public String loginSelect(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".loginSelect", id);
	}

	@Override
	public MemberVO loginMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".loginMember", id);
	}

	@Override
	public Integer idCheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".idCheck", id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateMember", vo);
	}
	
	

}
