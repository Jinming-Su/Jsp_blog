package com.sjming.controller;

import java.awt.geom.Ellipse2D;
import java.util.Collections;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.net.ssl.SSLException;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.catalina.ha.session.SimpleTcpReplicationManager;
import org.apache.catalina.startup.Embedded;
import org.apache.el.MethodExpressionLiteral;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjming.dao.ArticleDao;
import com.sjming.dao.CommentDao;
import com.sjming.dao.FriendDao;
import com.sjming.dao.UserDao;
import com.sjming.model.ArticleVO;
import com.sjming.model.CommentVO;
import com.sjming.model.FriendVO;
import com.sjming.model.UserVO;
import com.sun.java.swing.plaf.motif.resources.motif;
import com.sun.org.apache.xml.internal.serializer.ElemDesc;
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;

import groovy.lang.IntRange;

@Controller
@RequestMapping("/auth")
public class UserController {

	private UserDao userDao;
	private ArticleDao articleDao;
	private CommentDao commentDao;
	private FriendDao friendDao;

	@RequestMapping(value="/ajax_getname_by_uid", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxGetnameByUid(int uid) {
		UserVO userVO = userDao.select(uid);
		return userVO.getEmail();
	}
	
	@RequestMapping(value="/ajax_getuid_by_email.do", method=RequestMethod.POST)
	@ResponseBody
	public int ajaxGetUidByEmail(String email) {
		UserVO userVO = userDao.selectByEmail(email).get(0);
		return userVO.getUid();
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "auth/login";
	}
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login2(String email, String password, Model model, HttpSession session) {
		Boolean flag = false;
		List<UserVO> users = userDao.selectByEmail(email);
		if(users.size() == 0) {
			flag = false;
		} else {
			if(users.get(0).getPassword().equals(password)) {
				flag = true;
			}
		}
		if(flag == true) {
			session.setAttribute("loginUid", users.get(0).getUid());
			session.setAttribute("loginEmail", users.get(0).getEmail());
			session.setAttribute("loginLevel", users.get(0).getLevel());
			model.addAttribute("info1", "登录成功");
			model.addAttribute("info2", "博客主页");
			model.addAttribute("url", "http://localhost:8080/Jsp_blog/article/list/1.do");
			return "other/loading";
		} else {
			model.addAttribute("info1", "登录失败");
			model.addAttribute("info2", "博客主页，进行重新登录");
			model.addAttribute("url", "http://localhost:8080/Jsp_blog/article/list/1.do");
			return "other/loading";
		}
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register() {
		return "auth/register";
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register2(String email, String password, String password_confirmation, Model model) {
		Boolean flag1 = password.equals(password_confirmation);
		Boolean flag2 = false;
		List<UserVO> users = userDao.find();
		for(int i=0;i<users.size();i++) {
			if(users.get(i).getEmail().equals(email)) {
				flag2 = true;
			}
		}
		
		if(email == "") {
			model.addAttribute("error", "邮箱不可为空");
			return "auth/register";
		} else if(password == "" || password_confirmation == "") {
			model.addAttribute("error", "密码不可为空");
			return "auth/register";
		} else if(flag2 == true) {
			model.addAttribute("error", "该邮箱不可用");
			return "auth/register";
		} else if(flag1 == false) {
			model.addAttribute("error", "两次密码不一致");
			return "auth/register";
		}  else {
			
			model.addAttribute("info1", "注册成功");
			model.addAttribute("info2", "博客主页");
			model.addAttribute("url", "http://localhost:8080/Jsp_blog/article/list/1.do");
			
			UserVO userVO = new UserVO(email, password);
			userDao.insert(userVO);
			return "other/loading";
		}
	}
	
	@RequestMapping("/profile/{uid}.do")
	public String profile(@PathVariable int uid, HttpSession session, Model model) {
		if(session.getAttribute("loginUid") != null) {
			UserVO userVO = userDao.select(uid);
			
			List<ArticleVO> articles = articleDao.find();
			Collections.reverse(articles);
			for(int i=0;i<articles.size();i++) {
				if(!(articles.get(i).getAuther().equals(userVO.getEmail()))) {
					articles.remove(i);
					i--;
				}
			}
			
			List<CommentVO> comments = commentDao.find();
			for(int i=0;i<comments.size();i++) {
				if(!(comments.get(i).getUid() == uid )) {
					comments.remove(i);
					i--;
				}
			}
			
			List<FriendVO> friends = friendDao.find();
			List<UserVO> users = userDao.find();
			List<UserVO> targets = userDao.find();
			targets.clear();
			List<UserVO> sources = userDao.find();
			sources.clear();
			for(int i=0;i<friends.size();i++) {
				if(friends.get(i).getSource() == uid) {
					for(int j=0;j<users.size();j++) {
						if(users.get(j).getUid() == friends.get(i).getTarget()) {
							targets.add(users.get(j));
							break;
						}
					}
				}
				
				if(friends.get(i).getTarget() == uid) {
					for(int j=0;j<users.size();j++) {
						if(users.get(j).getUid() == friends.get(i).getSource()) {
							sources.add(users.get(j));
							break;
						}
					}
				}
			}
			
			
			model.addAttribute("user", userVO);
			model.addAttribute("targets", targets);
			model.addAttribute("targetsNum", targets.size());
			model.addAttribute("sources", sources);
			model.addAttribute("sourcesNum", sources.size());
			model.addAttribute("articles", articles);
			model.addAttribute("comments", comments);
			return "dashboard/profile";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="setting.do", method=RequestMethod.GET)
	public String setting1(HttpSession session, Model model) {
		if(session.getAttribute("loginUid") != null) {
			UserVO user = userDao.select((int)session.getAttribute("loginUid"));
			model.addAttribute("user", user);
			return "dashboard/setting";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/setting.do", method=RequestMethod.POST)
	public String setting2(String education, String address, 
						   String skill1, String skill2, String skill3,
						   HttpSession session, Model model) {
		if(session.getAttribute("loginUid") != null) {
			
			UserVO user = userDao.select((int)session.getAttribute("loginUid"));
			user.setEducation(education);
			user.setAddress(address);
			user.setSkill1(skill1);
			user.setSkill2(skill2);
			user.setSkill3(skill3);
			userDao.update(user);
			
			model.addAttribute("user", user);
			return "dashboard/setting";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			session.removeAttribute("loginUid");
			session.removeAttribute("loginEmail");
			return "../index";
		} else {
			return "other/404";
		}
		
	}
	
	@RequestMapping(value="/user_manage.do", method=RequestMethod.GET)
	public String userManage(Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null && 
		   session.getAttribute("loginLevel").toString().equals("1")) {
			List<UserVO> users = userDao.find();
			
			model.addAttribute("users", users);
			return "dashboard/user_manage";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/user_manage/ajax_article_num.do", method=RequestMethod.POST)
	@ResponseBody
	public int ajaxArticleNum(int uid) {
		List<ArticleVO> articles = articleDao.find();
		int num = 0;
		for(int i=0;i<articles.size();i++) {
			if(articles.get(i).getAuther().equals(userDao.select(uid).getEmail())) {
				num++;
			}
		}
		return num;
	}
	
	@RequestMapping(value="/user_manage/ajax_comment_num.do", method=RequestMethod.POST)
	@ResponseBody
	public int ajaxCommentNum(int uid) {
		List<CommentVO> comments = commentDao.find();
		int num = 0;
		for(int i=0;i<comments.size();i++) {
			if(comments.get(i).getUid() == uid) {
				num++;
			}
		}
		return num;
	}
	
	@RequestMapping(value="/{uid}/delete.do", method=RequestMethod.POST)
	public String delete(@PathVariable int uid, HttpSession session){
		if(session.getAttribute("loginUid") != null && 
				   session.getAttribute("loginLevel").toString().equals("1")) {
			userDao.delete(uid);
			return "redirect:../user_manage.do";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/ajaxupdate.do")
	public void ajaxUpdate(int uid, String email, int score, int level) {
		UserVO userVO = userDao.select(uid);
		userVO.setEmail(email);
		userVO.setScore(score);
		userVO.setLevel(level);
		userDao.update(userVO);
	}
	
	public UserDao getUserDao() {
		return userDao;
	}
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	public CommentDao getCommentDao() {
		return commentDao;
	}
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	public FriendDao getFriendDao() {
		return friendDao;
	}

	public void setFriendDao(FriendDao friendDao) {
		this.friendDao = friendDao;
	}

}
