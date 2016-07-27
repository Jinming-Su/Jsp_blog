package com.sjming.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.sjming.model.ArticleDaoImp;
import com.sjming.model.ArticleVO;

public class ArticleDao implements ArticleDaoImp {
	
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void insert(ArticleVO articleVO) {
		String sql = "insert into article(title, auther) values('test','sjming')";
		jdbcTemplate.update(sql);
	}

	public void delete(int aid) {
		// TODO Auto-generated method stub

	}

	public void update(ArticleVO articleVO) {
		// TODO Auto-generated method stub

	}

	public ArticleVO select(int aid) {
		// TODO Auto-generated method stub
		return null;
	}

}
