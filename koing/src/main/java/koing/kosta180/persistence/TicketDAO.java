package koing.kosta180.persistence;

import java.util.HashMap;
import java.util.List;

import koing.kosta180.domain.StoreVO;
import koing.kosta180.domain.TicketVO;

public interface TicketDAO {
	
	public List<StoreVO> getStoreList(String id) throws Exception;
	public void insertTicket(TicketVO vo)throws Exception;
	public void issuedTicket(TicketVO vo)throws Exception;
	public void completeTicket(TicketVO vo)throws Exception;
	
	public TicketVO readTicket(String t_bno)throws Exception;
	
	public void updateTicket(TicketVO vo)throws Exception;
	
	public void deleteTicket(String t_bno)throws Exception;
	
	public List<TicketVO> listAllTicket()throws Exception;
	public List<TicketVO> listMemberTicket(String id)throws Exception;
	public List<TicketVO> listManagerTicket(String id)throws Exception;
	
	public void insertIssue(HashMap<String, Object> map) throws Exception;
	public int duplicateIssue(String i_no) throws Exception;
	public List<TicketVO> issuedTicketManagement(String t_bno) throws Exception;
	public int completeTicketInsert(String i_no) throws Exception;
	
	
}
