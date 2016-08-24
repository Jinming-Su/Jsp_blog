package com.sjming.dao;

import java.security.KeyStore.PrivateKeyEntry;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sjming.model.CommentVO;

public class CommentDao implements CommentDaoImp {

	private JdbcTemplate jdbcTemplate;

	public void insert(CommentVO commentVO) {
		
		String sql = "insert into comment(content, aid, uid) values(?, ?, ?)";
		jdbcTemplate.update(sql, new Object[] {
				commentVO.getContent(), commentVO.getAid(),
				commentVO.getUid()
		});
	}

	public void delete(int cid) {
		String sql = "delete from comment where cid = ?";
		jdbcTemplate.update(sql, new Object []{
				cid
		});
	}

	public void update(CommentVO commentVO) {
		String sql = "update comment set content = ? where cid = ?";
		jdbcTemplate.update(sql, new Object[]{
				commentVO.getContent(), commentVO.getCid()
		});
	}

	public CommentVO select(int cid) {
		String sql = "select * from comment where cid = ?";
		List<CommentVO> tmp = jdbcTemplate.query(sql, new Object []{
				cid
		}, new CommentRowMapper());
		if(tmp.size() != 0) {
			return tmp.get(0);
		} else {
			return null;
		}
	}

	public List<CommentVO> find(int aid) {
		
		String sql = "select * from comment where aid = ?";
		return jdbcTemplate.query(sql, new Object[] {
				aid
		}, new CommentRowMapper());
	}
	private static final class CommentRowMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CommentVO commentVO = new CommentVO();
			commentVO.setCid(rs.getInt("cid"));
			commentVO.setContent(rs.getString("content"));
			commentVO.setAid(rs.getInt("aid"));
			commentVO.setUid(rs.getInt("uid"));
			commentVO.setCreated_time(rs.getTimestamp("created_time").getTime());
			return commentVO;
		}
		
	}
	public List<CommentVO> find() {
		String sql = "select * from comment";
		return jdbcTemplate.query(sql, new CommentRowMapper());
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
}
