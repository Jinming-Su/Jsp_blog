package com.sjming.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.el.sql.UpdateTag;
import org.aspectj.weaver.ast.Var;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjming.dao.ArticleDao;
import com.sjming.dao.CatalogDao;
import com.sjming.model.ArticleVO;
import com.sjming.model.CatalogVO;
import com.sun.corba.se.spi.activation.Server;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

	private CatalogDao catalogDao;
	private ArticleDao articleDao;

	@RequestMapping(value="/{father_name}/{pageNum}.do", method=RequestMethod.GET)
	public String list1(@PathVariable String father_name, @PathVariable int pageNum, Model model) throws UnsupportedEncodingException {
		
		father_name = URLDecoder.decode(father_name, "UTF-8");
		/*分页*/
		List<ArticleVO> articles_all = articleDao.find();
		Collections.reverse(articles_all);
		for(int i=0;i<articles_all.size();i++) {
			if((articles_all.get(i).getfather_catalog()).equals(father_name)) {
				continue;
			} else {
				articles_all.remove(i);
				i--;
			}
		}
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
		int father_clid = 0;
		List<CatalogVO> catalogs = catalogDao.find();
		Collections.sort(catalogs, new Comparator<CatalogVO>() {
			public int compare(CatalogVO catalogVO1, CatalogVO catalogVO2) {
				return catalogVO1.getId() - catalogVO2.getId();
			}
		});
		for(int i=0;i<catalogs.size();i++) {
			if(catalogs.get(i).getName()!=null && (catalogs.get(i).getName()).equals(father_name)) {
				father_clid = catalogs.get(i).getClid();
			}
			if(catalogs.get(i).getName() == null) {
				catalogs.remove(i);
				i--;
			}
		}
		model.addAttribute("father_name", father_name);
		model.addAttribute("father_clid", father_clid);
		model.addAttribute("catalogs", catalogs);
		return "catalog/list_by_father";
	}
	
	@RequestMapping(value="/{father_name}/{son_name}/{pageNum}.do", method=RequestMethod.GET)
	public String list2(@PathVariable String father_name, @PathVariable String son_name,
			@PathVariable int pageNum, Model model) throws UnsupportedEncodingException {
		
		father_name = URLDecoder.decode(father_name, "UTF-8");
		son_name = URLDecoder.decode(son_name, "UTF-8");
		/*分页*/
		List<ArticleVO> articles_all = articleDao.find();
		Collections.reverse(articles_all);
		for(int i=0;i<articles_all.size();i++) {
			if((articles_all.get(i).getfather_catalog()).equals(father_name) &&
			   (articles_all.get(i).getSon_catalog()).equals(son_name)	) {
				continue;
			} else {
				articles_all.remove(i);
				i--;
			}
		}
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
		int father_clid = 0;
		List<CatalogVO> catalogs = catalogDao.find();
		Collections.sort(catalogs, new Comparator<CatalogVO>() {
			public int compare(CatalogVO catalogVO1, CatalogVO catalogVO2) {
				return catalogVO1.getId() - catalogVO2.getId();
			}
		});
		for(int i=0;i<catalogs.size();i++) {
			if(catalogs.get(i).getName()!=null && (catalogs.get(i).getName()).equals(father_name)) {
				father_clid = catalogs.get(i).getClid();
			}
			if(catalogs.get(i).getName() == null) {
				catalogs.remove(i);
				i--;
			}
		}
		model.addAttribute("father_name", father_name);
		model.addAttribute("son_name", son_name);
		model.addAttribute("father_clid", father_clid);
		model.addAttribute("catalogs", catalogs);
		return "catalog/list_by_father_and_son";
	}
	
	@RequestMapping("/ajaxcreate.do")
	@ResponseBody
	public int create() {
		CatalogVO catalogVO = new CatalogVO();
		catalogVO.setId(0);
		catalogVO.setName(null);
		catalogVO.setChild1(null);
		catalogVO.setChild2(null);
		catalogVO.setChild3(null);
		catalogVO.setChild4(null);
		catalogVO.setChild5(null);
		catalogDao.insert(catalogVO);
		return catalogDao.getMaxClid();
	}
	
	@RequestMapping("/ajaxupdate.do")
	public void update(int clid, int id, String name, String child1, String child2, String child3,
			String child4, String child5) {
		CatalogVO catalogVO = new CatalogVO();
		catalogVO.setClid(clid);
		catalogVO.setId(id);
		catalogVO.setName(name);
		catalogVO.setChild1(child1);
		catalogVO.setChild2(child2);
		catalogVO.setChild3(child3);
		catalogVO.setChild4(child4);
		catalogVO.setChild5(child5);
		catalogDao.update(catalogVO);
	}
	
	@RequestMapping("/manage.do")
	public String manage(Model model, HttpSession session) {
		if(session.getAttribute("loginUid") != null &&
		   session.getAttribute("loginLevel").toString().equals("1")) {
			List<CatalogVO> catalogs = catalogDao.find();
			model.addAttribute("catalogs", catalogs);
			return "dashboard/catalog_manage";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/{clid}/delete.do", method=RequestMethod.POST)
	public String delete(@PathVariable int clid, HttpSession session) {
		if(session.getAttribute("loginUid") != null &&
				   session.getAttribute("loginLevel").toString().equals("1")) {
			catalogDao.delete(clid);
			return "redirect:../manage.do";
		} else {
			return "other/404";
		}
	}
	
	@RequestMapping(value="/ajax_get_num1.do", method=RequestMethod.POST)
	@ResponseBody
	public int getNumCatalog1(String name) {
		List<ArticleVO> articles = articleDao.find();
		int cnt = 0;
		for(int i=0;i<articles.size();i++) {
			if(articles.get(i).getfather_catalog().equals(name)) {
				cnt++;
			}
		}
		return cnt;
	}
	
	@RequestMapping(value="/ajax_get_num2.do", method=RequestMethod.POST)
	@ResponseBody
	public int getNumCatalog2(String father_name, String son_name) {
		List<ArticleVO> articles = articleDao.find();
		int cnt = 0;
		for(int i=0;i<articles.size();i++) {
			if(articles.get(i).getfather_catalog().equals(father_name) &&
					articles.get(i).getSon_catalog().equals(son_name) ) {
				cnt++;
			}
		}
		return cnt;
	}
	
	public CatalogDao getCatalogDao() {
		return catalogDao;
	}
	public void setCatalogDao(CatalogDao catalogDao) {
		this.catalogDao = catalogDao;
	}
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
}
