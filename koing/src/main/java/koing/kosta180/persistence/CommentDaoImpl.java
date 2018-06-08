package koing.kosta180.persistence;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.CommentVO;
import koing.kosta180.domain.Criteria;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Inject
	private SqlSession session;

	private static String namespace = "koing.kosta180.mapper.CommentMapper";

	@Override
	public List<CommentVO> listComment(String s_no) throws Exception {
		return session.selectList(namespace + ".listComment", s_no);
	}

	@Override
	public void insertComment(CommentVO comment) {
		session.insert(namespace + ".insertComment", comment);
	}

	@Override
	public CommentVO getComment(String c_no) {
		return session.selectOne(namespace + ".getComment", c_no);
	}

	@Override
	public void updateComment(CommentVO comment) {
		session.update(namespace + ".updateComment", comment);
	}

	@Override
	public void deleteComment(String c_no) {
		session.delete(namespace + ".deleteComment", c_no);
	}

	@Override
	public List<CommentVO> listPage(String s_no, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("s_no", s_no);
		paramMap.put("cri", cri);
		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(String s_no) throws Exception {
		return session.selectOne(namespace + ".count", s_no);
	}

}