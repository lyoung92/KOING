package koing.kosta180.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MatchingMemberVO;
import koing.kosta180.domain.MatchingResVO;
import koing.kosta180.domain.MatchingVO;
import koing.kosta180.domain.MemberVO;
import koing.kosta180.service.MatchingService;

@Controller
@RequestMapping("/matching/")
public class MatchingController {

	@Inject
	private MatchingService service;
	
	@RequestMapping(value = "insertMatching", method = RequestMethod.GET)
	public void insertMatching(Model model) throws Exception {
		model.addAttribute("storeList",service.allStoreList());
	}
	
	@RequestMapping(value = "insertMatching", method = RequestMethod.POST)
	public String insertMatching(MatchingVO matching, HttpServletRequest request,HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		
		matching.setId(member.getId());
		String s_no = request.getParameter("s_no");
		System.out.println(s_no+" , "+matching.toString());
		
		service.insertMatching(matching, s_no);
		
		return "redirect: /matching/listAllMatching";
	}
	
	@RequestMapping(value = "/readMatching", method = RequestMethod.GET)
	public String readMatching(@RequestParam("mc_bno") String mc_bno, Model model, HttpServletRequest request)
			throws Exception {
		MatchingVO matching = service.readMatching(mc_bno);
		System.out.println(matching.toString());
		model.addAttribute("matching", matching);

		return "/matching/detailMatching";
	}

	@RequestMapping(value = "updateMatching", method = RequestMethod.GET)
	public String next(MatchingVO matching, Model model, HttpServletRequest request) throws Exception {
		String mc_bno = request.getParameter("mc_bno");
		matching.setMc_bno(mc_bno);

		model.addAttribute("matching", service.readMatching(mc_bno));
		
		return "/matching/updateMatching";
	}
	
	@RequestMapping(value = "updateMatching", method = RequestMethod.POST)
	public void updateMatching(MatchingVO matching, Model model, HttpServletRequest request) throws Exception {
		matching.setMc_title(request.getParameter("mc_title"));
		matching.setMc_contents(request.getParameter("mc_contents"));
		matching.setMc_bno(request.getParameter("mc_bno"));
		matching.setS_name(request.getParameter("s_name"));
		matching.setMc_entryfee(request.getParameter("mc_entryfee"));
		matching.setMc_date(request.getParameter("mc_date"));
		matching.setMc_time(request.getParameter("mc_time"));
		System.out.println(matching.toString());
		service.updateMatching(matching);
	}

	@RequestMapping(value = "deleteMatching", method = RequestMethod.GET)
	public String deleteMatching(@RequestParam("mc_bno") String mc_bno, HttpServletRequest request) throws Exception {
		service.deleteMatching(mc_bno);
		return "redirect:/matching/listMyMatching";
	}

	@RequestMapping(value = "listAllMatching", method = RequestMethod.GET)
	public String listAllMatching(MatchingVO matching, Model model, HttpServletRequest request) throws Exception {
		List<MatchingVO> matchingList = service.listAllMatching();
		model.addAttribute("allMatchingList", matchingList);

		return "/matching/listAllMatching";
	}

	@RequestMapping(value = "listMyMatching", method = RequestMethod.GET)
	public String listMyMatching(Model model, HttpServletRequest request, HttpSession session) throws Exception {

		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		MatchingResVO matchingRes = service.reserveinfo("1");
		model.addAttribute("matchingRes", matchingRes);
		List<MatchingVO> matchingList = service.listMyMatching(member.getId());
		for(int i =0; i<matchingList.size(); i++){
		System.out.println(matchingList.get(i));
		}
		model.addAttribute("myMatchingList", matchingList);

		return "/matching/listMyMatching";
	}

	@RequestMapping(value = "applyMatching", method = RequestMethod.GET)
	public String applyMatching(MatchingMemberVO mm,MemberVO vo, HttpServletRequest request, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		mm.setMc_bno(request.getParameter("mc_bno"));
		mm.setId(member.getId());
		String mc_bno = request.getParameter("mc_bno");
		service.applyMatching(mm);
		service.countPlus(mc_bno);
		String id = service.getId(mc_bno);
		vo.setM_email(service.getMail(id));
		String m_email = vo.getM_email();
		MatchingVO matching = service.Matchinginfo(mc_bno);
		if(matching.getMc_totalnum() == matching.getMc_applicantnum()){
			service.sendMail(m_email);
		}
		return "redirect:/matching/readMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "cancelMatching", method = RequestMethod.GET)
	public String cancelMatching(MatchingMemberVO mm, HttpServletRequest request, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		mm.setMc_bno(request.getParameter("mc_bno"));
		mm.setId(member.getId());
		String mc_bno = request.getParameter("mc_bno");
		service.cancelMatching(mc_bno);
		service.countMinus(mc_bno);

		return "redirect:/matching/readMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "reserveMatching", method = RequestMethod.GET)
	public String reserveMatching(MatchingResVO mr, HttpServletRequest request) throws Exception {
		mr.setMc_bno(request.getParameter("mc_bno"));
		String mc_bno = request.getParameter("mc_bno");
		service.reserveMatching(mc_bno);
		return "redirect:/matching/listMyMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "cancelResMatching", method = RequestMethod.GET)
	public String cancelResMatching(MatchingResVO mr, HttpServletRequest request) throws Exception {
		mr.setMc_bno(request.getParameter("mc_bno"));
		String mc_bno = request.getParameter("mc_bno");
		service.cancelResMatching(mc_bno);
		return "redirect:/matching/listMyMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "acceptRes", method = RequestMethod.GET)
	public String acceptRes(MatchingResVO mr, HttpServletRequest request) throws Exception {
		mr.setMc_bno(request.getParameter("mc_bno"));
		String mc_bno = request.getParameter("mc_bno");
		service.acceptRes(mc_bno);
		return "redirect:/matching/listMyMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "rejectRes", method = RequestMethod.GET)
	public String rejectRes(MatchingResVO mr, HttpServletRequest request) throws Exception {
		mr.setMc_bno(request.getParameter("mc_bno"));
		String mc_bno = request.getParameter("mc_bno");
		service.rejectRes(mc_bno);
		return "redirect:/matching/listMyMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "sendMail", method = RequestMethod.GET)
	public String sendMail(MemberVO vo, Model model, HttpServletRequest request) throws Exception {
		String mc_bno = request.getParameter("mc_bno");
		String id = service.getId(mc_bno);
		vo.setM_email(service.getMail(id));
		String m_email = vo.getM_email();
		System.out.println(m_email);
		System.out.println("sendMail.......");
		service.sendMail(m_email);
		
		return "matching/readMatching?mc_bno=" + mc_bno;
	}

	@RequestMapping(value = "listCategoryMatching", method = RequestMethod.GET)
	public String listCategoryMatching(MatchingVO matching,CategoryScoreVO category,Model model, HttpServletRequest request, HttpSession session) throws Exception {
		 MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		List<CategoryScoreVO> categoryList = service.getMemberCategory(member.getId());
		List<String> catesno = service.categorysno();
		List<MatchingVO> mc = new ArrayList<>();

		for(int a=0; a < catesno.size(); a++){
			boolean find = false;
			List<CategoryScoreVO> categoryList2 = service.getMcCategory(catesno.get(a));			
			for(int i=0; i<categoryList.size(); i++){				
				for(int j=0; j<categoryList2.size(); j++){
				if(categoryList.get(i).getName().equals(categoryList2.get(j).getName())){
						find = true;
					}
				}
			}
			
			if(find){
				//System.out.println(catesno.get(a));
				List<MatchingVO> list = service.listCateMatching(catesno.get(a));
				if(list!=null){
					mc.addAll(list);
				}
			}
		}
		
		System.out.println(mc.size());
		model.addAttribute("category", mc);

		return "/matching/listCategoryMatching";
	}
}
