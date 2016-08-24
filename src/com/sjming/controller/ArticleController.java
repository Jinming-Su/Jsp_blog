package com.sjming.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Vector;

import javax.jws.WebParam.Mode;
import javax.naming.directory.SearchControls;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjming.dao.ArticleDao;
import com.sjming.dao.CatalogDao;
import com.sjming.dao.CommentDao;
import com.sjming.dao.UserDao;
import com.sjming.model.ArticleVO;
import com.sjming.model.CatalogVO;
import com.sjming.model.CommentVO;
import com.sjming.model.UserVO;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	private ArticleDao articleDao; 	
	private CommentDao commentDao;
	private CatalogDao catalogDao;
	private UserDao userDao;

	@SuppressWarnings("null")
	@RequestMapping(value="/list/{pageNum}.do", method=RequestMethod.GET)
	public String list(@PathVariable int pageNum, Model model) {
		/*分页*/
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
		/*分类导航*/
		List<CatalogVO> catalogs = catalogDao.find();
		Collections.sort(catalogs, new Comparator<CatalogVO>() {
			public int compare(CatalogVO catalogVO1, CatalogVO catalogVO2) {
				return catalogVO1.getId() - catalogVO2.getId();
			}
		});
		for(int i=0;i<catalogs.size();i++) {
			if(catalogs.get(i).getName() == null) {
				catalogs.remove(i);
			}
		}
		model.addAttribute("catalogs", catalogs);
		return "article/list";
	}
	
	@RequestMapping(value="/search/{key}/{pageNum}.do", method=RequestMethod.GET)
	public String list1(@PathVariable String key, @PathVariable int pageNum, Model model) throws UnsupportedEncodingException {
		key = URLDecoder.decode(key, "UTF-8");
		/*分页*/
		List<ArticleVO> articles_all = articleDao.search(key);
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
		
		model.addAttribute("key", key);
		return "article/search";
	}
	
	@RequestMapping(value="/search.do", method=RequestMethod.POST)
	public String search(String key) throws UnsupportedEncodingException {
		if(key == "") {
			key = " ";
		}
		return "redirect:search/"+URLEncoder.encode(URLEncoder.encode(key, "utf-8"))+"/1.do";
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public String create(Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			//根据id获取用户
			UserVO user = userDao.select((int) session.getAttribute("loginUid"));
			if(user.getLevel() == 2||user.getLevel() == 1) {
				List<CatalogVO> catalogs = catalogDao.find();
				for(int i=0;i<catalogs.size();i++) {
					if(catalogs.get(i).getName() == null) {
						catalogs.remove(i);
					}
				}
				model.addAttribute("catalogs", catalogs);
				return "article/create";
			} else {
				return "other/404";
			}
			
		} else {
			return "other/404";
		}
		
	}
	
	@RequestMapping("/create/ajax_select_son.do")
	@ResponseBody
	public CatalogVO getSelectSon(String select_father) {
		List<CatalogVO> catalogs = catalogDao.find();
		for(int i=0;i<catalogs.size();i++) {
			if(select_father.equals(catalogs.get(i).getName())) {
				return catalogs.get(i);
			}
		}
		return null;
	}
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public String create2(String title, String content, String key_word, 
			String father_catalog, String son_catalog, Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			//根据id获取用户
			UserVO user = userDao.select((int) session.getAttribute("loginUid"));
			if(user.getLevel() == 2||user.getLevel() == 1) {
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
					
					ArticleVO articleVO = new ArticleVO(title,content,key_word,
							father_catalog, son_catalog, (String)session.getAttribute("loginEmail"));
					articleDao.insert(articleVO);
					return "redirect:list/1.do";
				}
			} else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/{index}.do", method=RequestMethod.GET)
	public String detail(@PathVariable int index, Model model) {
		ArticleVO articleVO = articleDao.select(index);
		if(articleVO == null) {
			return "other/404";
		}
		model.addAttribute("article", articleVO);
		List<CommentVO> comments = commentDao.find(index);
		model.addAttribute("comments", comments);
		return "article/detail";
	}
	
	@RequestMapping(value="/manage.do", method=RequestMethod.GET)
	public String manage(Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			List<ArticleVO> articles = articleDao.find();
			Collections.reverse(articles);
			if(session.getAttribute("loginLevel").toString().equals("1")) {
				model.addAttribute("articles", articles);
				return "dashboard/article_manage";
			} else if(session.getAttribute("loginLevel").toString().equals("2")) {
				for(int i=0;i<articles.size();i++) {
					if(!(articles.get(i).getAuther().equals(session.getAttribute("loginEmail")))) {
						articles.remove(i);
						i--;
					}
				}
				model.addAttribute("articles", articles);
				return "dashboard/article_manage";
			} else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/{aid}/edit.do", method=RequestMethod.GET)
	public String edit(@PathVariable int aid, Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			if(session.getAttribute("loginLevel").toString().equals("1") ||
			   (session.getAttribute("loginLevel").toString().equals("2") &&
				articleDao.select(aid).getAuther().equals(session.getAttribute("loginEmail")))) {
					ArticleVO articleVO = articleDao.select(aid);
					model.addAttribute("article", articleVO);
					/*获取catalog*/
					List<CatalogVO> catalogs = catalogDao.find();
					for(int i=0;i<catalogs.size();i++) {
						if(catalogs.get(i).getName() == null) {
							catalogs.remove(i);
						}
					}
					model.addAttribute("catalogs", catalogs);
					return "article/edit";
			} else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
	}
	@RequestMapping(value="/{aid}/edit.do", method=RequestMethod.POST)
	public String edit2(@PathVariable int aid, String title, String content, String key_word, 
			String father_catalog, String son_catalog, Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			if(session.getAttribute("loginLevel").toString().equals("1") ||
			   (session.getAttribute("loginLevel").toString().equals("2") &&
				articleDao.select(aid).getAuther().equals(session.getAttribute("loginEmail")))) {
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
						ArticleVO articleVO = new ArticleVO(aid, title,content,key_word, father_catalog, son_catalog);
						articleDao.update(articleVO);
						return "redirect:../list/1.do";
					}
			}else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/{aid}/delete.do", method=RequestMethod.POST)
	public String delete(@PathVariable int aid, HttpSession session) {
		if(session.getAttribute("loginUid") != null) {
			if(session.getAttribute("loginLevel").toString().equals("1") ||
			   (session.getAttribute("loginLevel").toString().equals("2") &&
				articleDao.select(aid).getAuther().equals(session.getAttribute("loginEmail")))) {
					articleDao.delete(aid);
					return "redirect:../manage.do";
			} else {
				return "other/404";
			}
		} else {
			return "other/404";
		}
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
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
