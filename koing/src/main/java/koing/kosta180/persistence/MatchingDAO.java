package koing.kosta180.persistence;

import java.util.List;

import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MatchingMemberVO;
import koing.kosta180.domain.MatchingResVO;
import koing.kosta180.domain.MatchingVO;

public interface MatchingDAO {
	
	public void insertMatching(MatchingVO vo)throws Exception;
	
	public MatchingVO readMatching(String mc_bno)throws Exception;
	
	public void updateMatching(MatchingVO vo)throws Exception;
	
	public void deleteMatching(String mc_bno)throws Exception;
	
	public List<MatchingVO> listAllMatching()throws Exception;
	public List<MatchingVO> listMatching()throws Exception;
	public List<MatchingVO> listMyMatching(String id)throws Exception;
	
	public void applyMatching(MatchingMemberVO mm) throws Exception;
	public void cancelMatching(String mc_bno) throws Exception;

	public void countPlus(String mc_bno) throws Exception;
	public void countMinus(String mc_bno) throws Exception;

	public void reserveMatching(String mc_bno) throws Exception;
	public void cancelResMatching(String mc_bno) throws Exception;
	
	public MatchingResVO reserveinfo(String mc_bno)throws Exception;
	
	public void acceptRes(String mc_bno) throws Exception;
	public void rejectRes(String mc_bno) throws Exception;
	
	public String getMail(String m_email) throws Exception;
	public void sendMail(String id) throws Exception;
	
	public List<CategoryScoreVO> getMemberCategory(String id) throws Exception;
	public List<CategoryScoreVO> getMcCategory(String s_no) throws Exception;
	
	public List categorysno()throws Exception;
	
	public List<MatchingVO> listCateMatching(String s_no)throws Exception;
	
}
