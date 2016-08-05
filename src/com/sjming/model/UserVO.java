package com.sjming.model;

public class UserVO {
	
	private int uid;
	private String email;
	private String password;
	private int score;
	private int level;
	private long created_time;
	
	public UserVO(int uid, String email, String password, int score, int level, long created_time) {
		super();
		this.uid = uid;
		this.email = email;
		this.password = password;
		this.score = score;
		this.level = level;
		this.created_time = created_time;
	}
	public UserVO(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public UserVO() {
		super();
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public long getCreated_time() {
		return created_time;
	}
	public void setCreated_time(long created_time) {
		this.created_time = created_time;
	}
	
}
