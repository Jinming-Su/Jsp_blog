package com.sjming.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjming.dao.CommentDao;
import com.sjming.model.CommentVO;

@Controller
@RequestMapping("/article")
public class CommentController {
	
	private CommentDao commentDao;

	@RequestMapping(value="/{aid}/comment/create.do", method=RequestMethod.POST)
	public String create(@PathVariable int aid, String content, HttpSession session) {

		CommentVO commentVO = new CommentVO(content, aid, (int)session.getAttribute("loginUid"));
		commentDao.insert(commentVO);
		return "redirect:../../"+aid+".do";
	}
	
	
	
	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
}
