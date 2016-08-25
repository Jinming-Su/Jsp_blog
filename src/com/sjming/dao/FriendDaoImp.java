package com.sjming.dao;

import java.util.List;

import com.sjming.model.FriendVO;

public interface FriendDaoImp {
	
	public void insert(FriendVO friendVO);
	public void delete(int fid);
	public void update(FriendVO friendVO);
	public FriendVO select(int fid);
	public List<FriendVO> find();
}
