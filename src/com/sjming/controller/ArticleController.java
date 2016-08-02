package com.sjming.controller;

import java.util.Collections;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjming.dao.ArticleDao;
import com.sjming.dao.CatalogDao;
import com.sjming.dao.CommentDao;
import com.sjming.model.ArticleVO;
import com.sjming.model.CommentVO;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private ArticleDao articleDao; 	
	private CommentDao commentDao;
	private CatalogDao catalogDao;

	@SuppressWarnings("null")
	@RequestMapping(value="/list/{pageNum}.do", method=RequestMethod.GET)
	public String list(@PathVariable int pageNum, Model model) {
		List<ArticleVO> articles_all = articleDao.find();
		Collections.reverse(articles_all);
		List<ArticleVO> articles = articleDao.find();
		articles.clear();
		int articleNumInPage = 20;
		int number = (pageNum-1)*articleNumInPage;
		for(int i=number;i<articles_all.size()&&i<number+articleNumInPage;i++){
			ArticleVO articleVO_tmp = articles_all.get(i);
			articles.add(articleVO_tmp);
		}
		
		int page_num = articles_all.size()/articleNumInPage;
		if(articles_all.size()%articleNumInPage!=0){
			page_num = page_num + 1;
		}
		model.addAttribute("page_num", page_num);
		model.addAttribute("page_id", pageNum);
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
			return "redirect:list/1.do";
		}
	}
	
	@RequestMapping(value="/{index}.do", method=RequestMethod.GET)
	public String detail(@PathVariable int index, Model model) {
		ArticleVO articleVO = articleDao.select(index);
		model.addAttribute("article", articleVO);
		List<CommentVO> comments = commentDao.find(index);
		model.addAttribute("comments", comments);
		return "article/detail";
	}
	
	@RequestMapping(value="/manage.do", method=RequestMethod.GET)
	public String manage(Model model) {
		List<ArticleVO> articles = articleDao.find();
		model.addAttribute("articles", articles);
		return "dashboard/article_manage";
	}
	
	@RequestMapping(value="/{aid}/edit.do", method=RequestMethod.GET)
	public String edit(@PathVariable int aid, Model model) {
		ArticleVO articleVO = articleDao.select(aid);
		model.addAttribute("article", articleVO);
		return "article/edit";
	}
	@RequestMapping(value="/{aid}/edit.do", method=RequestMethod.POST)
	public String edit2(@PathVariable int aid, String title, String content, String key_word, Model model, HttpSession session) {
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
			ArticleVO articleVO = new ArticleVO(aid, title,content,key_word);
			articleDao.update(articleVO);
			return "redirect:../list/1.do";
		}
	}
	
	@RequestMapping(value="/{aid}/delete.do", method=RequestMethod.POST)
	public String delete(@PathVariable int aid) {
		articleDao.delete(aid);
		return "redirect:../manage.do";
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
	public CatalogDao getCatalogDao() {
		return catalogDao;
	}
	public void setCatalogDao(CatalogDao catalogDao) {
		this.catalogDao = catalogDao;
	}
}
