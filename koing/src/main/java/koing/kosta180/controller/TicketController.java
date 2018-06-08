package koing.kosta180.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import koing.kosta180.domain.TicketVO;
import koing.kosta180.service.TicketService;

@Controller
@RequestMapping("/ticket/")
public class TicketController {

	@Inject
	private TicketService service;

	@RequestMapping(value = "insertTicket", method = RequestMethod.POST)
	public void registerPOST(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {

		ticket.setT_contents(request.getParameter("t_contents"));
		ticket.setT_cost(Integer.parseInt(request.getParameter("t_cost")));
		ticket.setT_discount(Integer.parseInt(request.getParameter("t_discount")));
		ticket.setT_effectivelife(Integer.parseInt(request.getParameter("t_effectivelife")));
		System.out.println(ticket.toString());
		service.insertTicket(ticket);
	}

	@RequestMapping(value = "listAllTicket", method = RequestMethod.GET)
	public String listAllTicket(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {
		List<TicketVO> ticketList = service.listAllTicket();
		model.addAttribute("allTicketList", ticketList);

		return "ticket/listAllTicket";
	}

	@RequestMapping(value = "listManagerTicket", method = RequestMethod.GET)
	public String listManagerTicket(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {
		List<TicketVO> ticketList = service.listManagerTicket("hanna"); // �������� id �� �޾ƿ���
		model.addAttribute("managerTicketList", ticketList);

		return "listManagerTicket";
	}

	@RequestMapping(value = "listMemberTicket", method = RequestMethod.GET)
	public String listMemberTicket(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {
		List<TicketVO> ticketList = service.listMemberTicket();
		model.addAttribute("memberTicketList", ticketList);

		return "listMemberTicket";
	}

	@RequestMapping(value = "deleteTicket", method = RequestMethod.GET)
	public String deleteTicket(@RequestParam("t_bno") String t_bno, HttpServletRequest request) throws Exception {

		service.deleteTicket(t_bno);
		return "redirect:/listManagerTicket";
	}

	@RequestMapping(value = "updateTicket", method = RequestMethod.POST)
	public void updateTicket(TicketVO ticket, Model model, HttpServletRequest request) throws Exception {

		ticket.setT_contents(request.getParameter("t_contents"));
		ticket.setT_cost(Integer.parseInt(request.getParameter("t_cost")));
		ticket.setT_discount(Integer.parseInt(request.getParameter("t_discount")));
		ticket.setT_effectivelife(Integer.parseInt(request.getParameter("t_effectivelife")));
		ticket.setId(request.getParameter("hanna"));
		ticket.setT_bno(request.getParameter("t_bno"));
		System.out.println(ticket.toString());
		service.updateTicket(ticket);
	}

	@RequestMapping(value = "findTicket", method = RequestMethod.GET)
	public String readTicket(Model model, HttpServletRequest request) throws Exception {
		String t_bno = request.getParameter("t_bno");

		TicketVO ticket = service.readTicket(t_bno);
		model.addAttribute("ticket", ticket);

		return "updateTicket";
	}
	
	@RequestMapping(value = "detailTicket", method = RequestMethod.GET)
	public String detailTicket(Model model, HttpServletRequest request) throws Exception {
		String t_bno = request.getParameter("t_bno");

		TicketVO ticket = service.readTicket(t_bno);
		model.addAttribute("ticket", ticket);
		
		return "detailTicket";
	}
}
