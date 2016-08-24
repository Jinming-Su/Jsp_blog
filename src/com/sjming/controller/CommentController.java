package com.sjming.controller;

import java.security.KeyStore.PrivateKeyEntry;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.classpath.icedtea.pulseaudio.PulseAudioClip;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjming.dao.CommentDao;
import com.sjming.dao.UserDao;
import com.sjming.model.CommentVO;
import com.sjming.model.UserVO;

@Controller
public class CommentController {
	
	private CommentDao commentDao;
	private UserDao userDao;
	
	@RequestMapping(value="/article/{aid}/comment/create.do", method=RequestMethod.POST)
	public String create(@PathVariable int aid, String content, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			CommentVO commentVO = new CommentVO(content, aid, (int)session.getAttribute("loginUid"));
			commentDao.insert(commentVO);
			
			UserVO userVO = userDao.select((int)session.getAttribute("loginUid"));
			userVO.setScore(userVO.getScore()+1);
			userDao.update(userVO);
			
			return "redirect:../../"+aid+".do";
		} else {
			return "other/404";
		}
		
	}
	
	@RequestMapping(value="/comment/manage.do", method=RequestMethod.GET)
	public String manage(Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			List<CommentVO> comments = commentDao.find();
			Collections.reverse(comments);
			if(session.getAttribute("loginLevel").toString().equals("1")) {
				model.addAttribute("comments", comments);
				return "dashboard/comment_manage";
			} else if(session.getAttribute("loginLevel") != null){
				for(int i=0;i<comments.size();i++) {
					if(!(comments.get(i).getUid() == (int)session.getAttribute("loginUid"))) {
						comments.remove(i);
						i--;
					}
				}
				model.addAttribute("comments", comments);
				return "dashboard/comment_manage";
			} else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
		
	}
	
	@RequestMapping(value="/comment/{cid}/delete.do")
	public String delete(@PathVariable int cid, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			if(session.getAttribute("loginLevel").toString().equals("1") || 
			   commentDao.select(cid).getUid() == (int)session.getAttribute("loginUid")) {
				commentDao.delete(cid);
				return "redirect:../manage.do";
			} else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
		
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
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
