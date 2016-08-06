package com.sjming.model;

public class UserVO {
	
	private int uid;
	private String email;
	private String password;
	private int score;
	private int level;
	private long created_time;
	private String education;
	private String address;
	private String skill1;
	private String skill2;
	private String skill3;
	
	
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
	
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSkill1() {
		return skill1;
	}
	public void setSkill1(String skill1) {
		this.skill1 = skill1;
	}
	public String getSkill2() {
		return skill2;
	}
	public void setSkill2(String skill2) {
		this.skill2 = skill2;
	}
	public String getSkill3() {
		return skill3;
	}
	public void setSkill3(String skill3) {
		this.skill3 = skill3;
	}
}
