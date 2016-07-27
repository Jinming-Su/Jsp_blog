package com.sjming.model;

public interface ArticleDaoImp {
	
	public void insert(ArticleVO articleVO);
	public void delete(int aid);
	public void update(ArticleVO articleVO);
	public ArticleVO select(int aid);
}
