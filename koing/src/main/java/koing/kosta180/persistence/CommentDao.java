package koing.kosta180.persistence;

import java.util.List;

import koing.kosta180.domain.CommentVO;
import koing.kosta180.domain.Criteria;

public interface CommentDao {
	public List<CommentVO> listComment(String s_no) throws Exception;
	
	public void insertComment(CommentVO comment) throws Exception;
	
	public void updateComment(CommentVO comment) throws Exception;
	
	public void deleteComment(String c_no) throws Exception;

	public CommentVO getComment(String c_no) throws Exception;
	
	public List<CommentVO> listPage(String s_no, Criteria cri) throws Exception;
	
	public int count(String s_no) throws Exception;
}
