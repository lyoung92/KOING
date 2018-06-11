package koing.kosta180.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import koing.kosta180.domain.CommentVO;
import koing.kosta180.domain.Criteria;
import koing.kosta180.domain.ReservationVO;
import koing.kosta180.persistence.CommentDao;

@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	private CommentDao dao;
	
	@Override
	public void addComment(CommentVO comment) throws Exception {
		dao.insertComment(comment);

	}

	@Override
	public List<CommentVO> listComment(String s_no) throws Exception {
		return dao.listComment(s_no);
	}

	@Override
	public void updateComment(CommentVO comment) throws Exception {
		dao.updateComment(comment);

	}

	@Override
	public void deleteComment(String c_no) throws Exception {
		dao.deleteComment(c_no);
		System.out.println("service delete 진입");
	}

	@Override
	public List<CommentVO> listCommentPage(String s_no, Criteria cri) throws Exception {
		return dao.listPage(s_no,cri);
	}

	@Override
	public int count(String s_no) throws Exception {
		return dao.count(s_no);
	}

	@Override
	public CommentVO getComment(String c_no) throws Exception {
		return dao.getComment(c_no);
	}

	@Override
	public List<ReservationVO> reseerveStore(HashMap<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.reseerveStore(map);
	}
	
}
