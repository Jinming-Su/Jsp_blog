package com.sjming.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sjming.model.CatalogVO;

public class CatalogDao implements CatalogDaoImp {

	private JdbcTemplate jdbcTemplate;
	
	public void insert(CatalogVO catalogVO) {
		String sql = "insert into catalog(name, id, child1, child2, child3, child4, child5) "
				+ "values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object [] {
				catalogVO.getName(),catalogVO.getId(),
				catalogVO.getChild1(),catalogVO.getChild2(),catalogVO.getChild3(),
				catalogVO.getChild4(),catalogVO.getChild5()
		});
		
	}

	public void delete(int clid) {
		String sql = "delete from catalog where clid = ?";
		jdbcTemplate.update(sql, new Object [] {
				clid
		});
	}

	public void update(CatalogVO catalogVO) {

	}

	public List<CatalogVO> find() {
		String sql = "select * from catalog";
		return jdbcTemplate.query(sql, new CatalogMapper());
	}
	private static final class CatalogMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CatalogVO catalogVO = new CatalogVO();
			catalogVO.setClid(rs.getInt("clid"));
			catalogVO.setId(rs.getInt("id"));
			catalogVO.setName(rs.getString("name"));
			catalogVO.setChild1(rs.getString("child1"));
			catalogVO.setChild2(rs.getString("child2"));
			catalogVO.setChild3(rs.getString("child3"));
			catalogVO.setChild4(rs.getString("child4"));
			catalogVO.setChild5(rs.getString("child5"));
			return catalogVO;
		}
		
	}

	public CatalogVO select(int clid) {
		
		return null;
	}
	
	public int getMaxClid() {
		String sql = "select max(clid) from catalog";
		return jdbcTemplate.queryForInt(sql);
	}

	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
