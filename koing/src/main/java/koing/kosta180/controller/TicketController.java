package koing.kosta180.controller;

import java.lang.reflect.Member;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;
import koing.kosta180.domain.TicketVO;
import koing.kosta180.service.TicketService;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {

	@Inject
	private TicketService service;
	
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@RequestMapping(value = "insertTicket", method = RequestMethod.GET)
	public void registerGET( Model model, HttpSession session) throws Exception {
		logger.info("insertTicket get.............................");
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		System.out.println("insertTicket member : " + member.getId());
		List<StoreVO> storeList  = service.getStoreList(member.getId());
		model.addAttribute("storeList",storeList);
	}
	

	@RequestMapping(value = "insertTicket", method = RequestMethod.POST)
	public String registerPOST(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {

		logger.info(ticket.toString());
		service.insertTicket(ticket);
		
		return "redirect:ticket/insertTicket";
	}

	@RequestMapping(value = "listAllTicket", method = RequestMethod.GET)
	public void listAllTicket(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {
		logger.info("listAllTicket GET................................");
		List<TicketVO> ticketList = service.listAllTicket();
		model.addAttribute("allTicketList", ticketList);

		//return "ticket/listAllTicket";
	}


	@RequestMapping(value = "listMemberTicket", method = RequestMethod.GET)
	public String listMemberTicket(TicketVO ticket, Model model, HttpServletRequest request, HttpSession session ) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		String id = member.getId();
		List<TicketVO> memberTicketList = service.listMemberTicket(id);
		List<TicketVO> managerTicketList = service.listManagerTicket(id); 
		
		for(int i=0; i<memberTicketList.size();i++){
			String valid = memberTicketList.get(i).getI_valid();
			int index =valid.indexOf(":");
			valid = valid.substring(0,index-2);
			memberTicketList.get(i).setI_valid(valid);
		}
		
		for(int i=0; i<memberTicketList.size(); i++){
			if(memberTicketList.get(i).getCom_contents()==null){
				memberTicketList.get(i).setCom_contents("사용가능");
			}
		}
		
		System.out.println("memberticket : "+memberTicketList.toString());
		System.out.println("managerticket : "+managerTicketList.toString());
		model.addAttribute("memberTicketList", memberTicketList);
		model.addAttribute("managerTicketList", managerTicketList);

		return "ticket/listMemberTicket";
	}

	

	@RequestMapping(value = "updateTicket", method = RequestMethod.POST)
	public void updateTicket(TicketVO ticket, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println(ticket.toString());
		service.updateTicket(ticket);
		model.addAttribute("ticket",ticket);
	}

	@RequestMapping(value = "findTicket", method = RequestMethod.GET)
	public String readTicket(Model model, HttpServletRequest request) throws Exception {
		logger.info("updateTicket.............................");
		String t_bno = request.getParameter("t_bno");

		TicketVO ticket = service.readTicket(t_bno);
		model.addAttribute("ticket", ticket);

		return "ticket/updateTicket";
	}
	
	//쿠폰 삭제
	@RequestMapping(value = "deleteTicket", method = RequestMethod.GET)
	public String deleteTicket(@RequestParam("t_bno") String t_bno, HttpServletRequest request) throws Exception {

		service.deleteTicket(t_bno);
		return "redirect:/ticket/listMemberTicket";
	}
	
	//쿠폰 상세페이지
	@RequestMapping(value = "detailTicket", method = RequestMethod.GET)
	public String detailTicket(Model model, HttpServletRequest request) throws Exception {
		logger.info("detailTicket GET.......................................");
		String t_bno = request.getParameter("t_bno");

		TicketVO ticket = service.readTicket(t_bno);
		model.addAttribute("ticket", ticket);
		
		return "ticket/detailTicket";
	}
	
	//사용완료처리
	@RequestMapping(value="completeTicketInsert", method=RequestMethod.POST)
	public String completeTicketInsert(Model model, HttpServletRequest request, String i_no,
			@RequestParam("path") String path) throws Exception{
		
		logger.info(path);
		
		logger.info("completeTicketInsert Post.................");
		
		service.completeTicketInsert(i_no);
		
		return "redirect: "+path;
		
	}
	
	//티켓관리
	@RequestMapping(value="issuedTicketManagement",method=RequestMethod.GET)
	public void issuedTicketManage(Model model, HttpSession session, String t_bno)throws Exception{
		logger.info("issuedTicketManage GET............................");
		List<TicketVO> ticketList = service.issuedTicketManagement(t_bno);
		
		for(int i=0; i<ticketList.size();i++){
			String valid = ticketList.get(i).getI_valid();
			int index =valid.indexOf(":");
			valid = valid.substring(0,index-2);
			ticketList.get(i).setI_valid(valid);
		}
		
		
		for(int i=0; i<ticketList.size(); i++){
			if(ticketList.get(i).getCom_contents()==null){
				ticketList.get(i).setCom_contents("미사용");
			}
		}
		
		logger.info(ticketList.toString());
		model.addAttribute("ticketList",ticketList);
	}
	
	//쿠폰 구매
	@RequestMapping(value = "insertIssue", method = RequestMethod.POST)
	public String insertIssue(Model model, TicketVO ticket, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		String t_bno = ticket.getT_bno();
		Integer t_life = ticket.getT_effectivelife();
		String id = member.getId();

		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, t_life);

		// 특정 형태의 날짜로 값을 뽑기
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String t_effectivelife = df.format(cal.getTime());
		
		
		//발행되는 티켓 번호(총 12자리 0000-0000-0000)
		Random random = new Random();
		String i_no = "";
		
		
		do {
			//처음에는 임의의 대문자 + 숫자 + 숫자 + 임의의 대문자 (4자리 ex.B01C)
			i_no = String.valueOf((char) ((int) (random.nextInt(26)) + 65)) + random.nextInt(10) + random.nextInt(10) + String.valueOf((char) ((int) (random.nextInt(26)) + 65)) + "-";
			//두번째 숫자 숫자 문자 숫자 (ex.12F4)
			i_no = i_no + random.nextInt(10) + random.nextInt(10) + String.valueOf((char) ((int) (random.nextInt(26)) + 65)) + random.nextInt(10)+"-";
			//세번째 문자 숫자 숫자 숫자 (ex.A194)
			i_no = i_no + String.valueOf((char) ((int) (random.nextInt(26)) + 65)) + random.nextInt(10) + random.nextInt(10) + random.nextInt(10); 
		} while (service.duplicateIssue(i_no));

		System.err.println(i_no);
		System.err.println(t_bno);
		System.err.println(id);
		System.err.println(t_effectivelife);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("i_no",i_no);
		map.put("t_bno",t_bno );
		map.put("t_effectivelife", t_effectivelife);	
		map.put("id", id);
		
		service.insertIssue(map);
		return "redirect:/ticket/listAllTicket";
	}
	
	
	
}
