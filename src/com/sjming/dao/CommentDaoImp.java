package com.sjming.dao;

import java.util.List;

import com.sjming.model.CommentVO;

public interface CommentDaoImp {
	
	public void insert(CommentVO commentVO);
	public void delete(int cid);
	public void update(CommentVO commentVO);
	public CommentVO select(int cid);
	public List<CommentVO> find(int aid);
}
