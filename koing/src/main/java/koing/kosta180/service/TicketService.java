package koing.kosta180.service;

import java.util.List;

import koing.kosta180.domain.TicketVO;

public interface TicketService {
	
	public void insertTicket(TicketVO vo)throws Exception;
	public void issuedTicket(TicketVO vo)throws Exception;
	public void completeTicket(TicketVO vo)throws Exception;
	
	public TicketVO readTicket(String t_bno)throws Exception;
	
	public void updateTicket(TicketVO vo)throws Exception;
	
	public void deleteTicket(String t_bno)throws Exception;
	
	public List<TicketVO> listAllTicket()throws Exception;
	public List<TicketVO> listMemberTicket()throws Exception;
	public List<TicketVO> listManagerTicket(String id)throws Exception;
	
}
