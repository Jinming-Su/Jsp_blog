package com.sjming.controller;

import java.util.List;

import javax.jws.WebParam.Mode;
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
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;

import groovy.lang.IntRange;

@Controller
@RequestMapping("/auth")
public class UserController {

	private UserDao userDao;

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "auth/login";
	}
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login2(String email, String password, HttpSession session) {
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
			String username = email;
			session.setAttribute("loginUid", users.get(0).getUid());
			session.setAttribute("loginEmail", users.get(0).getEmail());
			return "redirect:../article/list/1.do";
		} else {
			return "auth/login";
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
		if(flag1 == false || flag2 == true) {
			model.addAttribute("error", "your password is wrong");
			return "auth/register";
		} else {
			UserVO userVO = new UserVO(email, password, 0);
			userDao.insert(userVO);
			return "auth/login";
		}
	}
	
	@RequestMapping("profile.do")
	public String profile() {
		
		return "dashboard/profile";
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
