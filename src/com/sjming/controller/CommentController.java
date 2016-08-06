package com.sjming.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.classpath.icedtea.pulseaudio.PulseAudioClip;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjming.dao.CommentDao;
import com.sjming.model.CommentVO;

@Controller
public class CommentController {
	
	private CommentDao commentDao;
	
	@RequestMapping(value="/article/{aid}/comment/create.do", method=RequestMethod.POST)
	public String create(@PathVariable int aid, String content, HttpSession session) {

		CommentVO commentVO = new CommentVO(content, aid, (int)session.getAttribute("loginUid"));
		commentDao.insert(commentVO);
		return "redirect:../../"+aid+".do";
	}
	
	@RequestMapping(value="/comment/manage.do", method=RequestMethod.GET)
	public String manage(Model model) {
		
		List<CommentVO> comments = commentDao.find();
		model.addAttribute("comments", comments);
		return "dashboard/comment_manage";
	}
	
	@RequestMapping(value="/comment/{cid}/delete.do")
	public String delete(@PathVariable int cid) {
		
		commentDao.delete(cid);
		return "redirect:../manage.do";
	}
	
	
	@RequestMapping(value="/comment/ajaxupdate.do", method=RequestMethod.POST)
	public void ajaxUpdate(int cid, String content) {
		CommentVO comment = commentDao.select(cid);
		comment.setContent(content);

		commentDao.update(comment);
	}
	
	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
}
