package com.sjming.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sjming.model.ArticleVO;

public class ArticleDao implements ArticleDaoImp {
	
	private JdbcTemplate jdbcTemplate;

	public void insert(ArticleVO articleVO) {
		String sql = "insert into article(title, content, key_word, auther) "
				+ "values(?, ?, ?, ?)";
		jdbcTemplate.update(sql, new Object[]{
				articleVO.getTitle(), articleVO.getContent(),
				articleVO.getKey_word(), articleVO.getAuther()
		});
	}

	public void delete(int aid) {
		// TODO Auto-generated method stub

	}

	public void update(ArticleVO articleVO) {
		// TODO Auto-generated method stub

	}

	public ArticleVO select(int aid) {
		
		
		return null;
	}
	
	/*
	 * find all articles
	 * (non-Javadoc)
	 * @see com.sjming.model.ArticleDaoImp#find()
	 */
	public List<ArticleVO> find() {
		String sql = "select * from article";
		return jdbcTemplate.query(sql, new ArticleMapper());
	}
	
	private static final class ArticleMapper implements RowMapper{

		@Override
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			ArticleVO articleVO = new ArticleVO();
			articleVO.setAid(rs.getInt("aid"));
			articleVO.setTitle(rs.getString("title"));
			articleVO.setContent(rs.getString("content"));
			articleVO.setKey_word(rs.getString("key_word"));
			articleVO.setAuther(rs.getString("auther"));
			articleVO.setCreated_time(rs.getTimestamp("created_time").getTime());
			return articleVO;
		}
		
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


}
