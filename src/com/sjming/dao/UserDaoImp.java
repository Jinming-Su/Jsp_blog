package com.sjming.dao;

import java.util.List;

import com.sjming.model.UserVO;

public interface UserDaoImp {

	public void insert(UserVO userVO);
	public void delete(int uid);
	public void update(UserVO userVO);
	public List<UserVO> find();
	public UserVO select(int uid);
	public List<UserVO> selectByEmail(String email);
}
