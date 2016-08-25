package com.sjming.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sjming.model.FriendVO;

public class FriendDao implements FriendDaoImp {

	private JdbcTemplate jdbcTemplate;
	
	public void insert(FriendVO friendVO) {
		String sql = "insert into friend(source, target) values(?, ?) ";
		jdbcTemplate.update(sql, new Object[]{
				friendVO.getSource(), friendVO.getTarget()
		});
	}

	public void delete(int fid) {
		String sql = "delete from friend where fid = ?";
		jdbcTemplate.update(sql, new Object []{
				fid
		});
	}

	public void update(FriendVO friendVO) {

	}

	public FriendVO select(int fid) {
		
		return null;
	}

	public List<FriendVO> find() {
		String sql = "select * from friend";
		return jdbcTemplate.query(sql, new FriendRowMapper());
	}

	private static final class FriendRowMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			FriendVO friendVO = new FriendVO();
			friendVO.setFid(rs.getInt("fid"));
			friendVO.setSource(rs.getInt("source"));
			friendVO.setTarget(rs.getInt("target"));
			return friendVO;
		}
		
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
