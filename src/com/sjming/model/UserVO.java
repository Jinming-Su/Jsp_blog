package com.sjming.model;

public class UserVO {
	
	private int uid;
	private String email;
	private String password;
	private int score;
	private long created_time;
	
	public UserVO(int uid, String email, String password, int score, long created_time) {
		super();
		this.uid = uid;
		this.email = email;
		this.password = password;
		this.score = score;
		this.created_time = created_time;
	}

	public UserVO(String email, String password, int score) {
		super();
		this.email = email;
		this.password = password;
		this.score = score;
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
	
	public long getCreated_time() {
		return created_time;
	}

	public void setCreated_time(long created_time) {
		this.created_time = created_time;
	}
}
