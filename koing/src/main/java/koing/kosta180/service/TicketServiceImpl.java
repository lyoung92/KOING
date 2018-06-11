package koing.kosta180.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import koing.kosta180.domain.StoreVO;
import koing.kosta180.domain.TicketVO;
import koing.kosta180.persistence.TicketDAO;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Inject
	private TicketDAO dao;
	
	
	@Override
	public List<StoreVO> getStoreList(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getStoreList(id);
	}

	@Override
	public void insertTicket(TicketVO vo) throws Exception {
		dao.insertTicket(vo);
	}

	@Override
	public void issuedTicket(TicketVO vo) throws Exception {
		dao.issuedTicket(vo);
	}

	@Override
	public void completeTicket(TicketVO vo) throws Exception {
		dao.completeTicket(vo);
	}

	@Override
	public TicketVO readTicket(String t_bno) throws Exception {
		return dao.readTicket(t_bno);
	}

	@Override
	public void updateTicket(TicketVO vo) throws Exception {
		dao.updateTicket(vo);
	}

	@Override
	public void deleteTicket(String t_bno) throws Exception {
		dao.deleteTicket(t_bno);
	}

	@Override
	public List<TicketVO> listAllTicket() throws Exception {
		return dao.listAllTicket();
	}

	@Override
	public List<TicketVO> listMemberTicket(String id) throws Exception {
		return dao.listMemberTicket(id);
	}

	@Override
	public List<TicketVO> listManagerTicket(String id) throws Exception {
		return dao.listManagerTicket(id);
	}

	@Override
	public void insertIssue(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.insertIssue(map);
	}

	@Override
	public boolean duplicateIssue(String i_no) throws Exception {
		// TODO Auto-generated method stub
		boolean isDuplicate = false;
		int check = dao.duplicateIssue(i_no);
		if(check>0){
			isDuplicate = true;
		}
		return isDuplicate;
	}

	@Override
	public List<TicketVO> issuedTicketManagement(String t_bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.issuedTicketManagement(t_bno);
	}

	@Override
	public int completeTicketInsert(String i_no) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.completeTicketInsert(i_no);
	}
	
	
	
	
	
	
	
	
}
