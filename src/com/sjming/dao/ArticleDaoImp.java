package com.sjming.dao;

import java.util.List;

import com.sjming.model.ArticleVO;

public interface ArticleDaoImp {
	
	public void insert(ArticleVO articleVO);
	public void delete(int aid);
	public void update(ArticleVO articleVO);
	public ArticleVO select(int aid);
	public List<ArticleVO> search(String key);
	public List<ArticleVO> find();
}
