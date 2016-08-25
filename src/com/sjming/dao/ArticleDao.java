package com.sjming.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sjming.model.ArticleVO;
import com.sun.xml.internal.ws.policy.EffectiveAlternativeSelector;

public class ArticleDao implements ArticleDaoImp {
	
	private JdbcTemplate jdbcTemplate;

	public void insert(ArticleVO articleVO) {
		
		String sql = "insert into article(title, content, key_word, father_catalog, son_catalog, auther) "
				+ "values(?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, new Object[]{
				articleVO.getTitle(), articleVO.getContent(),
				articleVO.getKey_word(), articleVO.getfather_catalog(), 
				articleVO.getSon_catalog(), articleVO.getAuther()
		});
		
	}

	public void delete(int aid) {
		String sql = "delete from article where aid = ?";
		jdbcTemplate.update(sql, new Object[] {
				aid
		});
	}

	public void update(ArticleVO articleVO) {
		String sql = "update article set title = ?, content = ?, key_word = ?, father_catalog = ?,"
				+ "son_catalog = ? where aid = ?";
		jdbcTemplate.update(sql, new Object[] {
				articleVO.getTitle(), articleVO.getContent(),
				articleVO.getKey_word(), articleVO.getfather_catalog(),
				articleVO.getSon_catalog(), articleVO.getAid()
		});
	}

	public void updateAccessNum(ArticleVO articleVO) {
		String sql = "update article set access_num = ? where aid = ?";
		jdbcTemplate.update(sql, new Object[] {
				articleVO.getAccess_num(), articleVO.getAid()
		});
	}
	
	public ArticleVO select(int aid) {
		
		String sql = "select * from article where aid = ?";
		List<ArticleVO> tmp = jdbcTemplate.query(sql, new Object[]{
				aid
		}, new ArticleMapper());
		if(tmp.size() != 0) {
			return tmp.get(0);
		} else {
			return null;
		}
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
	
	public List<ArticleVO> search(String key) {
		String sql = "select * from article where title like '%"+key+"%'";
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
			articleVO.setfather_catalog(rs.getString("father_catalog"));
			articleVO.setSon_catalog(rs.getString("son_catalog"));
			articleVO.setAuther(rs.getString("auther"));
			articleVO.setCreated_time(rs.getTimestamp("created_time").getTime());
			articleVO.setAccess_num(rs.getInt("access_num"));
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
