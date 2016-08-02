package com.sjming.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjming.dao.CatalogDao;
import com.sjming.model.CatalogVO;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

	private CatalogDao catalogDao;
	
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
	
	@RequestMapping("/manage.do")
	public String manage(Model model) {
		
		List<CatalogVO> catalogs = catalogDao.find();
		model.addAttribute("catalogs", catalogs);
		return "dashboard/catalog_manage";
	}
	
	@RequestMapping(value="/{clid}/delete.do", method=RequestMethod.POST)
	public String delete(@PathVariable int clid) {
		
		catalogDao.delete(clid);
		return "redirect:../manage.do";
	}
	
	
	
	public CatalogDao getCatalogDao() {
		return catalogDao;
	}
	public void setCatalogDao(CatalogDao catalogDao) {
		this.catalogDao = catalogDao;
	}
}
