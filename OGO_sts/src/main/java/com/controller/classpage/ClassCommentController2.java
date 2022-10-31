package com.controller.classpage;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.classpage.ClassDTO;
import com.dto.comment.ClassCommentDTO;
import com.dto.member.MemberDTO;
import com.service.comment.ClassCommentService;

@Controller
public class ClassCommentController2 {
	@Autowired
	ClassCommentService service;
	
	
	//comment Insert
//	@RequestMapping(value = "/loginCheck/commentCreate", produces = "application/text;charset=utf8")
//	@ResponseBody
//	public String commentCreate(String commentText, HttpSession session) { //리뷰 생성 => 1.데이터 받기(textarea, classNum, userid)+dto전달 // 3.cmtadd로 같이 보내기 
//		System.out.println("commentText:"+commentText);
//		ClassDTO cDTO = (ClassDTO) session.getAttribute("classDTO");
//		int classNum =cDTO.getClassNum();
//		MemberDTO mDTO =(MemberDTO) session.getAttribute("login");
//		String userId=mDTO.getUserId();
//		
//		HashMap<String, Object> cmtData= new HashMap<String, Object>();
//		cmtData.put("commentText", commentText);
//		cmtData.put("classNum", classNum);
//		cmtData.put("userId", userId);
//		
//		int result =service.createComment(cmtData);
//		System.out.println("등록 성공:"+result);
//		
//	return "리뷰 등록 성공";
//	}
	
	@RequestMapping(value = "/loginCheck/commentCreate", produces = "application/text;charset=utf8")
	public String commentCreate(String commentText, HttpSession session) { //리뷰 생성 => 1.데이터 받기(textarea, classNum, userid)+dto전달 // 3.cmtadd로 같이 보내기 
		System.out.println("commentText:"+commentText);
		ClassDTO cDTO = (ClassDTO) session.getAttribute("classDTO");
		int classNum =cDTO.getClassNum();
		MemberDTO mDTO =(MemberDTO) session.getAttribute("login");
		String userId=mDTO.getUserId();
		
		HashMap<String, Object> cmtData= new HashMap<String, Object>();
		cmtData.put("commentText", commentText);
		cmtData.put("classNum", classNum);
		cmtData.put("userId", userId);
		
		int result =service.createComment(cmtData);
		System.out.println("등록 성공:"+result);
		
		return "redirect: ../ClassPage?listNum="+classNum;
	}


	
}//end