package koing.kosta180.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MatchingMemberVO;
import koing.kosta180.domain.MatchingResVO;
import koing.kosta180.domain.MatchingVO;
import koing.kosta180.domain.StoreVO;

@Repository
public class MatchingDAOImpl implements MatchingDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "koing.kosta180.mappers.MatchingMapper";
	
	@Override
	public void insertMatching(MatchingVO vo) throws Exception {
		session.insert(namespace + ".insertMatching", vo);
	}

	@Override
	public MatchingVO readMatching(String mc_bno) throws Exception {
		return session.selectOne(namespace + ".readMatching", mc_bno);
	}

	@Override
	public void updateMatching(MatchingVO vo) throws Exception {
		session.update(namespace + ".updateMatching", vo);
	}

	@Override
	public void deleteMatching(String mc_bno) throws Exception {
		session.delete(namespace + ".deleteMatching", mc_bno);
	}

	@Override
	public List<MatchingVO> listAllMatching() throws Exception {
		return session.selectList(namespace + ".listAllMatching");
	}

	@Override
	public List<MatchingVO> listMatching() throws Exception {
		return session.selectList(namespace + ".listMatching");
	}
	
	@Override
	public List<MatchingVO> listMyMatching(String id) throws Exception {
		return session.selectList(namespace + ".listMyMatching", id);
	}
	
	@Override
	public void applyMatching(MatchingMemberVO mm) throws Exception {
		session.insert(namespace + ".applyMatching", mm);
	}
	
	@Override
	public void cancelMatching(String mc_bno) throws Exception {
		session.insert(namespace + ".cancelMatching", mc_bno);
	}
	
	@Override
	public void countPlus(String mc_bno) throws Exception{
		session.update(namespace + ".countPlus", mc_bno);
	}
	
	@Override
	public void countMinus(String mc_bno) throws Exception{
		session.update(namespace + ".countMinus", mc_bno);
	}

	@Override
	public void reserveMatching(String mc_bno) throws Exception {
		session.insert(namespace + ".reserveMatching", mc_bno);
	}

	@Override
	public MatchingResVO reserveinfo(String mc_bno) throws Exception {
		return session.selectOne(namespace + ".reserveinfo", mc_bno);
	}

	@Override
	public void cancelResMatching(String mc_bno) throws Exception {
		session.delete(namespace + ".cancelResMatching", mc_bno);
	}

	@Override
	public void acceptRes(String mc_bno) throws Exception {
		session.update(namespace + ".acceptRes", mc_bno);
	}

	@Override
	public void rejectRes(String mc_bno) throws Exception {
		session.update(namespace + ".rejectRes", mc_bno);
	}

	@Override
	public void sendMail(String m_email) throws Exception {
		session.selectOne(namespace + ".sendMail", m_email);
	}

	@Override
	public String getMail(String id) throws Exception {
		return session.selectOne(namespace + ".getEmail", id);
	}

	@Override
	public List<CategoryScoreVO> getMemberCategory(String id) throws Exception {
		return session.selectList(namespace + ".getMemberCategory", id);
	}

	@Override
	public List<CategoryScoreVO> getMcCategory(String s_no) throws Exception {
		System.out.println(s_no);
		return session.selectList(namespace + ".getMcCategory", s_no);
	}

	@Override
	public List categorysno() throws Exception {
		return session.selectList(namespace + ".categorysno");
		}

	@Override
	public List<MatchingVO> listCateMatching(String s_no) throws Exception {
		return session.selectList(namespace + ".listCateMatching", s_no);
	}

	@Override
	public String getId(String mc_bno) throws Exception {
		return session.selectOne(namespace + ".getId", mc_bno);
	}

	@Override
	public MatchingVO Matchinginfo(String mc_bno) throws Exception {
		return session.selectOne(namespace + ".Matchinginfo", mc_bno);
	}

	@Override
	public List<StoreVO> allStoreList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".allStoreList");
	}

	@Override
	public String getStoreName(String s_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getStoreName",s_no);
	}
	
	
	
}






