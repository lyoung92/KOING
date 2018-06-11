package koing.kosta180.service;

import java.util.HashMap;
import java.util.List;

import koing.kosta180.domain.CommentVO;
import koing.kosta180.domain.Criteria;
import koing.kosta180.domain.ReservationVO;

public interface CommentService {
	public void addComment(CommentVO comment) throws Exception;
	
	public List<CommentVO> listComment(String s_no) throws Exception;
	
	public void updateComment(CommentVO comment) throws Exception;
	
	public void deleteComment(String c_no) throws Exception;
	
	public List<CommentVO> listCommentPage(String s_no, Criteria cri) throws Exception;
	
	public int count(String s_no) throws Exception;
	
	public CommentVO getComment(String c_no)throws Exception;
	
	public List<ReservationVO> reseerveStore(HashMap<String, String> map) throws Exception;
}
