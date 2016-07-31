package com.sjming.model;

public class CommentVO {
	
	private int cid;
	private String content;
	private int aid;
	private int uid;
	private long created_time;
	public CommentVO(int cid, String content, int aid, int uid, long created_time) {
		super();
		this.cid = cid;
		this.content = content;
		this.aid = aid;
		this.uid = uid;
		this.created_time = created_time;
	}
	public CommentVO(String content, int aid, int uid) {
		super();
		this.content = content;
		this.aid = aid;
		this.uid = uid;
	}
	public CommentVO() {
		super();
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public long getCreated_time() {
		return created_time;
	}
	public void setCreated_time(long created_time) {
		this.created_time = created_time;
	}
}
