package koing.kosta180.controller;


import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import koing.kosta180.domain.LocationStoreVO;
import koing.kosta180.domain.MemberVO;
import koing.kosta180.service.MemberService;
import koing.kosta180.service.StoreService;

@Controller
@RequestMapping("/join/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	@Inject
	private StoreService storeService;
	
	//아이디 중복확인 창
	@RequestMapping(value="IdCheckForm", method=RequestMethod.GET)
	public void IdCheckForm(String id,Model model) throws Exception{
		logger.info("IdCheckForm..................");
		model.addAttribute("userId",id);
	}
	
	//id 중복 여부 확인
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public void idCheck(String id ,HttpServletRequest request, HttpServletResponse response)throws Exception{
		logger.info("idCheck.............");
		int count = service.idCheck(id);
		request.setAttribute("checkId", count);
		
		PrintWriter out = response.getWriter();
		
		if(count>=1)    out.println("0"); // 아이디 중복
        else        out.println("1");
		
        out.close();
		
	}
	
	//회원가입으로 넘어가는 요청
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGet(Model model) throws Exception{
		logger.info("join get...................");
	}
	
	//회원가입 2번으로 넘어가는 요청
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPost(MemberVO member, Model model) throws Exception{
		logger.info("join post...................");
		logger.info("회원가입 정보 : "+member.toString());
		
		LocationStoreVO locationStoreVO = new LocationStoreVO();
		
		try {
			locationStoreVO =  storeService.locationStoreList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("locationStoreVO",locationStoreVO);
		return "/join/selectStore";
	}
	
	/*
	//test용 join2 get방식 
	@RequestMapping(value="/selectStore", method=RequestMethod.GET)
	public void selectStoreGet(Model model) throws Exception{
		logger.info("selectStore get..........");
	}
	*/
	
	//회원가입시 상점선택 페이지
	@RequestMapping(value="/selectStore", method=RequestMethod.POST)
	public String selectStorePost(MemberVO member ,Model model) throws Exception{
		logger.info("selectStore post..........");
		logger.info(member.toString());
		logger.info("입력 전 :" + member.getM_storeId());
	
		try {
			service.insertMember(member);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return"redirect: /main/main";
	}
	
	//로그인 요청
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(@RequestParam("id") String id, @RequestParam("pw") String pw, @RequestParam("path") String path, 
			Model model, HttpSession session) throws Exception {
		logger.info("loginAction post.............................");
		logger.info("path : " + path);
		MemberVO member = null;
		
		try {
			int check = service.loginSelect(id, pw);
			
			if(check == 0){	//비밀번호 오류
				logger.info("비밀번호 오류............ check : " + check);
				model.addAttribute("fail",check);
			} else if(check == -1){	//아이디 존재 안함
				logger.info("아이디 오류............... check : " + check);
				model.addAttribute("fail",check);
			} else{
				member = service.loginMember(id);
				logger.info("로그인 정보 : "+member.toString());
				session.setAttribute("sessionMember",member);
				logger.info("로그인 성공............... check : " + check);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect: "+path;
	}
	
	//로그아웃 요청
	@RequestMapping(value = "/logoutAction", method = RequestMethod.POST)
	public String logoutAction(Model model,@RequestParam("path") String path ,HttpSession session) throws Exception {
		logger.info("path : " + path);
		session.invalidate();
		return "redirect:" + path;
	}
	
	//회원정보 수정 폼 이동 요청
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public void updateMemberGet() throws Exception{
		logger.info("updateMemberGet..................");
	}
	
	//회원정보 수정 DB 저장 요청
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMemberPost(Model model ,@RequestParam("path") String path ,HttpSession session, MemberVO member) throws Exception {
		logger.info("updateMemberPost......................");
		logger.info("회원정보 수정 정보 member : " + member.toString());
		logger.info("path : " + path);
		
		try {
			service.updateMember(member);
			member = service.loginMember(member.getId());
			session.setAttribute("sessionMember", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:"+path;
	}
	
}
