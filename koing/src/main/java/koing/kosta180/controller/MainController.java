package koing.kosta180.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import koing.kosta180.domain.MemberVO;
import koing.kosta180.domain.StoreVO;
import koing.kosta180.service.RecommendService;


@Controller
@RequestMapping("/main/*")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private RecommendService service;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainGet(Model model, HttpSession session) throws Exception{
		logger.info("main get...................");
		List<StoreVO> recommendStoreList = new ArrayList<StoreVO>();
		
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		
		if(member==null){													//로그인 안되어있을 때
			recommendStoreList = service.mostLikeStoreList();
		}else{																			//로그인 되어있을 때 
			logger.info(member.getId());
			StoreVO preferredStore = service.preferredStore(member);
			
			
			if(preferredStore == null){	
				//활동내역이 없는 회원
				recommendStoreList = service.mostLikeStoreList();
			}else{
				//선호상점을 이용하여 추천
				recommendStoreList = service.recommendStoreList(preferredStore);
			}
		}

		try {
			for(int i= 0 ; i < recommendStoreList.size(); i++){
				logger.info(recommendStoreList.get(i).getS_no());
				logger.info(recommendStoreList.get(i).getS_name());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("recommendStoreList",recommendStoreList);
		
		return "/main/main";
	}
	
	
}