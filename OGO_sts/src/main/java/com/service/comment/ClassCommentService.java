package com.service.comment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.comment.ClassCommentDAO;
import com.dto.comment.ClassCommentDTO;
import com.dto.comment.ClassCommentPageDTO;


@Service
public class ClassCommentService {
	
	@Autowired
	ClassCommentDAO dao;
	
	public int cmtAdd(ClassCommentDTO cmt_dto) {
		int n = dao.cmtAdd(cmt_dto);
		return n;
	}
	
	
	public int cmtUpdate(ClassCommentDTO cmt_dto) {
		int n = dao.cmtUpdate(cmt_dto);
		return n;
	}
			
	public int cmtDelete(ClassCommentDTO cmt_dto) {
		int n = dao.cmtDelete(cmt_dto);
		return n;
	}
	
	public ClassCommentPageDTO viewPage(int curpage, int classNum) {
		ClassCommentPageDTO dto = dao.viewPage(curpage,classNum);
		return dto;
	}


//소현 추가
	public List<ClassCommentDTO> selectCmt(int classNum) {
		return dao.selectCmt(classNum);
	}


	public int createComment(HashMap<String, Object> cmtData) {
		return dao.createComment(cmtData);
	}


	public int deleteComment(HashMap<String, Object> cmtData) {
		return dao.deleteComment(cmtData);
	}


	

	
	
}//end class
