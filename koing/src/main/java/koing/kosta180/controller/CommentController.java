package koing.kosta180.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import koing.kosta180.domain.CommentVO;
import koing.kosta180.domain.Criteria;
import koing.kosta180.domain.PageMaker;
import koing.kosta180.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService service;
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody CommentVO comment){
		ResponseEntity<String> entity = null;
		try {
			service.addComment(comment);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{s_no}", method=RequestMethod.GET)
	public ResponseEntity<List<CommentVO>> list(@PathVariable("s_no")String s_no){
		ResponseEntity<List<CommentVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listComment(s_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{c_no}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("c_no")String c_no, @RequestBody CommentVO comment){
		ResponseEntity<String> entity = null;
		try {
			comment.setC_no(c_no);
			service.updateComment(comment);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{c_no}", method=RequestMethod.GET)
	public ResponseEntity<CommentVO> getComment(@PathVariable("c_no")String c_no){
		ResponseEntity<CommentVO> entity = null;
		System.out.println("c_no : "+c_no);
		try {
			entity = new ResponseEntity<CommentVO>(service.getComment(c_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CommentVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{c_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("c_no")String c_no){
		ResponseEntity<String> entity = null;
		try {
			service.deleteComment(c_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println("entity : "+entity);
		return entity;
	}
	
	@RequestMapping(value="/{s_no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("s_no")String s_no, @PathVariable int page){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.listCommentPage(s_no, cri);
			
			//timestamp to string
			for(int i=0; i<list.size(); i++){
				String sLatestLoginDate = "";
				try {
				  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				  sLatestLoginDate = formatter.format(list.get(i).getC_date());
				} catch (Exception ex) {
				  sLatestLoginDate = "";
				}
				list.get(i).setDateToString(sLatestLoginDate);
			}
			
			map.put("list", list);
			
			int replyCount = service.count(s_no);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


}
