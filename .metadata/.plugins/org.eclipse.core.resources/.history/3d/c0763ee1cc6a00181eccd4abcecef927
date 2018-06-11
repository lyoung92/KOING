package koing.kosta180.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import koing.kosta180.domain.TicketVO;
import koing.kosta180.persistence.TicketDAO;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Inject
	private TicketDAO dao;
	
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
	public List<TicketVO> listMemberTicket() throws Exception {
		return dao.listMemberTicket();
	}

	@Override
	public List<TicketVO> listManagerTicket(String id) throws Exception {
		return dao.listManagerTicket(id);
	}
}
