package com.sjming.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sjming.model.UserVO;

public class UserDao implements UserDaoImp {

	private JdbcTemplate jdbcTemplate;

	public void insert(UserVO userVO) {
		String sql = "insert into user(email, password) values(?, ?)";
		jdbcTemplate.update(sql, new Object[] {
				userVO.getEmail(), userVO.getPassword()
		});
	}

	@Override
	public void delete(int uid) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(UserVO userVO) {
		// TODO Auto-generated method stub

	}

	public List<UserVO> find() {
		String sql = "select * from user";
		return jdbcTemplate.query(sql, new userMapper());
	}
	private static final class userMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserVO userVO = new UserVO();
			userVO.setUid(rs.getInt("uid"));
			userVO.setEmail(rs.getString("email"));
			userVO.setPassword(rs.getString("password"));
			userVO.setCreated_time(rs.getTimestamp("created_time").getTime());
			return userVO;
		}
	}
	
	public UserVO select(int uid) {
		
		return null;
	}
	public List<UserVO> selectByEmail(String email) {
		String sql = "select * from user where email = ?";
		return jdbcTemplate.query(sql, new Object[]{
				email
		}, new userMapper());
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
}
