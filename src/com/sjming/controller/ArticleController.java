package com.sjming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjming.dao.ArticleDao;
import com.sjming.model.ArticleVO;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private ArticleDao articleDao; 	

	@RequestMapping("/list.do")
	public String index() {
		return "article/list";
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public String create() {
		return "article/create";
	}
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public void create2(String title, String content, String key_word) {
		System.out.println(title+content+key_word);
		ArticleVO articleVO = new ArticleVO("123", "sjming");
		articleDao.insert(articleVO);
	}
	
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
}
