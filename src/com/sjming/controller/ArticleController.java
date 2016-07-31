package com.sjming.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import com.sjming.dao.ArticleDao;
import com.sjming.model.ArticleVO;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private ArticleDao articleDao; 	

	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(Model model) {
		
		List<ArticleVO> articles = articleDao.find();
		model.addAttribute("articles",articles);
		return "article/list";
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public String create() {
		return "article/create";
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public String create2(String title, String content, String key_word, Model model, HttpSession session) {
		Vector<String> error = new Vector<String>();
		if(title.length() > 256 || title.length() == 0) {
			error.add("标题不超过256个字符且不为空");
		}
		if(key_word.length() > 256) {
			error.add("关键字不超过256个字符");
		}
		if(error.size() > 0 ){
			model.addAttribute("errors", error);
			return "article/create";
		} else {
			ArticleVO articleVO = new ArticleVO(title,content,key_word, (String)session.getAttribute("loginEmail"));
			articleDao.insert(articleVO);
			return "redirect:list.do";
		}
	}
	
	@RequestMapping(value="/{index}.do", method=RequestMethod.GET)
	public String detail(@PathVariable int index, Model model) {
		ArticleVO articleVO = articleDao.select(index);
		model.addAttribute("article", articleVO);
		return "article/detail";
	}
	
	@RequestMapping(value="/manage.do", method=RequestMethod.GET)
	public String manage(Model model) {
		List<ArticleVO> articles = articleDao.find();
		model.addAttribute("articles", articles);
		return "article/manage";
	}
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
}
