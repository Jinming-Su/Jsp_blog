package com.sjming.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.sjming.dao.FriendDao;
import com.sjming.model.FriendVO;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
	private FriendDao friendDao;
	
	@RequestMapping(value="/ajax_judge.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean ajaxJudge(int target, HttpSession session) {
		List<FriendVO> friends = friendDao.find();
		boolean flag = false;
		for(int i=0;i<friends.size();i++) {
			if(friends.get(i).getSource() == (int)session.getAttribute("loginUid") && 
					friends.get(i).getTarget() == target) {
				flag = true;
				break;
			}
		}
		return flag;
	}

	@RequestMapping(value="/ajax_add.do", method=RequestMethod.POST)
	public void ajaxAdd(int target, HttpSession session) {
		FriendVO friend = new FriendVO();
		friend.setSource((int)session.getAttribute("loginUid"));
		friend.setTarget(target);
		friendDao.insert(friend);
	}
	
	@RequestMapping(value="/ajax_delete.do", method=RequestMethod.POST)
	public void ajaxDelete(int target, HttpSession session) {
		List<FriendVO> friends = friendDao.find();
		int flagi = -1;
		for(int i=0;i<friends.size();i++) {
			if(friends.get(i).getSource() == (int)session.getAttribute("loginUid") && 
					friends.get(i).getTarget() == target) {
				flagi = friends.get(i).getFid();
				break;
			}
		}
		if(flagi != -1)
			friendDao.delete(flagi);
	}
	
	public FriendDao getFriendDao() {
		return friendDao;
	}

	public void setFriendDao(FriendDao friendDao) {
		this.friendDao = friendDao;
	}
}
