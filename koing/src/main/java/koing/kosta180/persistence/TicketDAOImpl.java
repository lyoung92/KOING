package koing.kosta180.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.TicketVO;

@Repository
public class TicketDAOImpl implements TicketDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "koing.kosta180.mappers.TicketMapper";

	@Override
	public void insertTicket(TicketVO vo) throws Exception {
		session.insert(namespace + ".insertTicket", vo);
	}

	@Override
	public void issuedTicket(TicketVO vo) throws Exception {
		session.insert(namespace+".issuedTicket", vo);
	}

	@Override
	public void completeTicket(TicketVO vo) throws Exception {
		session.insert(namespace+".completeTicket", vo);
	}

	@Override
	public TicketVO readTicket(String t_bno) throws Exception {
		return session.selectOne(namespace+".readTicket", t_bno);
	}

	@Override
	public void updateTicket(TicketVO vo) throws Exception {
		session.update(namespace+".updateTicket", vo);
	}

	@Override
	public void deleteTicket(String t_bno) throws Exception {
		session.delete(namespace+".deleteTicket", t_bno);
	}

	@Override
	public List<TicketVO> listAllTicket() throws Exception {
		return session.selectList(namespace+".listAllTicket");
	}

	@Override
	public List<TicketVO> listMemberTicket() throws Exception {
		return session.selectList(namespace+".listMemberTicket");
	}

	@Override
	public List<TicketVO> listManagerTicket(String id) throws Exception {
		return session.selectList(namespace+".listManagerTicket", id);
	}
}
