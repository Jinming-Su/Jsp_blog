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
		String sql = "delete from user where uid = ?";
		jdbcTemplate.update(sql, new Object []{
				uid
		});
	}

	@Override
	public void update(UserVO userVO) {
		String sql = "update user set email = ?, password = ?, score = ?, level = ?,"
				+ "education = ?, address = ?, skill1 = ?, skill2 = ?, skill3 = ? "
				+ "where uid = ?";
		jdbcTemplate.update(sql, new Object []{
				userVO.getEmail(), userVO.getPassword(), userVO.getScore(), userVO.getLevel(),
				userVO.getEducation(), userVO.getAddress(), userVO.getSkill1(),
				userVO.getSkill2(), userVO.getSkill3(),
				userVO.getUid()
		});
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
			userVO.setScore(rs.getInt("score"));
			userVO.setLevel(rs.getInt("level"));
			userVO.setCreated_time(rs.getTimestamp("created_time").getTime());
			userVO.setEducation(rs.getString("education"));
			userVO.setAddress(rs.getString("address"));
			userVO.setSkill1(rs.getString("skill1"));
			userVO.setSkill2(rs.getString("skill2"));
			userVO.setSkill3(rs.getString("skill3"));
			return userVO;
		}
	}
	
	public UserVO select(int uid) {
		String sql = "select * from user where uid = ?";
		List<UserVO> tmp = jdbcTemplate.query(sql, new Object [] {
				uid
		}, new userMapper());
		if(tmp.size() != 0) {
			return tmp.get(0);
		} else {
			return null;
		}
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
