package com.sjming.dao;

import java.util.List;

import com.sjming.model.CatalogVO;

public interface CatalogDaoImp {
	
	public void insert(CatalogVO catalogVO);
	public void delete(int clid);
	public void update(CatalogVO catalogVO);
	public List<CatalogVO> find();
	public CatalogVO select(int clid);
	public int getMaxClid();
}
