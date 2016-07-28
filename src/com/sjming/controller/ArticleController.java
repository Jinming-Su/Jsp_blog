package com.sjming.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.jws.WebParam.Mode;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		for(int i=0;i<articles.size();i++) {
			System.out.println(articles.get(i).getCreated_time());
		}
		model.addAttribute("articles",articles);
		return "article/list";
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public String create() {
		return "article/create";
	}
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public void create2(String title, String content, String key_word) {
		ArticleVO articleVO = new ArticleVO(title,content,key_word,"sjming");
		articleDao.insert(articleVO);
	}
	
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
}
