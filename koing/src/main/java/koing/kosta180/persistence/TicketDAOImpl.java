package koing.kosta180.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import koing.kosta180.domain.StoreVO;
import koing.kosta180.domain.TicketVO;

@Repository
public class TicketDAOImpl implements TicketDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "koing.kosta180.mappers.TicketMapper";


	@Override
	public List<StoreVO> getStoreList(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getStoreList", id);
	}

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
	public List<TicketVO> listMemberTicket(String id) throws Exception {
		System.out.println(id);
		return session.selectList(namespace+".listMemberTicket",id);
	}

	@Override
	public List<TicketVO> listManagerTicket(String id) throws Exception {
		return session.selectList(namespace+".listManagerTicket", id);
	}

	@Override
	public void insertIssue(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertIssue",map);
	}

	@Override
	public int duplicateIssue(String i_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".duplicateIssue", i_no);
	}

	@Override
	public List<TicketVO> issuedTicketManagement(String t_bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".issuedTicketManagement",t_bno);
	}

	@Override
	public int completeTicketInsert(String i_no) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".completeTicketInsert",i_no);
	}


	
	
	
	
	
	
	
	
	
}
