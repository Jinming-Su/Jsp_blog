package com.sjming.model;

public class FriendVO {
	int fid;
	int source;
	int target;
	
	public FriendVO(int fid, int source, int target) {
		super();
		this.fid = fid;
		this.source = source;
		this.target = target;
	}
	public FriendVO(int source, int target) {
		super();
		this.source = source;
		this.target = target;
	}
	public FriendVO() {
		super();
	}
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	
	
}
