package com.sjming.controller;

import java.awt.geom.Ellipse2D;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.net.ssl.SSLException;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.catalina.startup.Embedded;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjming.dao.UserDao;
import com.sjming.model.UserVO;
import com.sun.org.apache.xml.internal.serializer.ElemDesc;
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;

import groovy.lang.IntRange;

@Controller
@RequestMapping("/auth")
public class UserController {

	private UserDao userDao;

	@RequestMapping(value="/ajax_getname_by_uid", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxGetnameByUid(int uid) {
		UserVO userVO = userDao.select(uid);
		return userVO.getEmail();
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
	
	@RequestMapping("profile.do")
	public String profile(HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			return "dashboard/profile";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUid");
		session.removeAttribute("loginEmail");
		return "../index";
	}
	
	@RequestMapping(value="/user_manage.do", method=RequestMethod.GET)
	public String userManage(Model model) {
		List<UserVO> users = userDao.find();
		model.addAttribute("users", users);
		return "dashboard/user_manage";
	}
	
	public UserDao getUserDao() {
		return userDao;
	}
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
