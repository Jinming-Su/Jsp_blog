package com.sjming.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ArticleVO {
	
	private int aid;
	private String title;
	private String content;
	private String key_word;
	private String father_catalog;
	private String son_catalog;
	private String auther;
	private long created_time;
	
	
	public ArticleVO(int aid, String title, String content, String key_word, String father_catalog, String son_catalog,
			String auther, long created_time) {
		super();
		this.aid = aid;
		this.title = title;
		this.content = content;
		this.key_word = key_word;
		this.father_catalog = father_catalog;
		this.son_catalog = son_catalog;
		this.auther = auther;
		this.created_time = created_time;
	}
	public ArticleVO(int aid, String title, String content, String key_word, String father_catalog, String son_catalog,
			String auther) {
		super();
		this.aid = aid;
		this.title = title;
		this.content = content;
		this.key_word = key_word;
		this.father_catalog = father_catalog;
		this.son_catalog = son_catalog;
		this.auther = auther;
	}
	public ArticleVO(int aid, String title, String content, String key_word, String father_catalog,
			String son_catalog) {
		super();
		this.aid = aid;
		this.title = title;
		this.content = content;
		this.key_word = key_word;
		this.father_catalog = father_catalog;
		this.son_catalog = son_catalog;
	}
	
	public ArticleVO(String title, String content, String key_word, String father_catalog, String son_catalog,
			String auther) {
		super();
		this.title = title;
		this.content = content;
		this.key_word = key_word;
		this.father_catalog = father_catalog;
		this.son_catalog = son_catalog;
		this.auther = auther;
	}
	public ArticleVO() {
		super();
	}
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKey_word() {
		return key_word;
	}
	public void setKey_word(String key_word) {
		this.key_word = key_word;
	}
	public String getAuther() {
		return auther;
	}
	public void setAuther(String auther) {
		this.auther = auther;
	}
	public String getfather_catalog() {
		return father_catalog;
	}
	public void setfather_catalog(String father_catalog) {
		this.father_catalog = father_catalog;
	}
	public String getSon_catalog() {
		return son_catalog;
	}
	public void setSon_catalog(String son_catalog) {
		this.son_catalog = son_catalog;
	}
	public long getCreated_time() {
		return created_time;
	}
	public void setCreated_time(long created_time) {
		this.created_time = created_time;
	}
}
