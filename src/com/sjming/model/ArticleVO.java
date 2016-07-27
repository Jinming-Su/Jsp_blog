package com.sjming.model;

public class ArticleVO {
	
	private String title;
	private String auther;
	
	public ArticleVO(String title, String auther) {
		super();
		this.title = title;
		this.auther = auther;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuther() {
		return auther;
	}

	public void setAuther(String auther) {
		this.auther = auther;
	}
}
