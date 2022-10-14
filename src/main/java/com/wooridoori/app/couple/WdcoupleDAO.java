package com.wooridoori.app.couple;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("wdcoupleDAO")
public class WdcoupleDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_selectOne_W="SELECT * FROM WDCOUPLE WHERE WDCWOORI = ?";
	final String sql_selectOne_D="SELECT * FROM WDCOUPLE WHERE WDCDOORI = ?";
	final String sql_insert="INSERT INTO WDCOUPLE VALUES((SELECT NVL(MAX(WDCPK),0) +1 FROM WDCOUPLE),?,?,?)";
	final String sql_delete="DELETE FROM WDCOUPLE WHERE WDCPK=?";
	
	void insertWdcouple(WdcoupleVO vo) {
		jdbcTemplate.update(sql_insert,vo.getWdcwoori(),vo.getWdcdoori(),vo.getWdcdate());
	}
	void deleteWdcouple(WdcoupleVO vo) {
		jdbcTemplate.update(sql_delete,vo.getWdcpk());
	}
	WdcoupleVO selectOneW(WdcoupleVO vo) {
		Object[] args= {vo.getWdcwoori()};
		try {	
			return jdbcTemplate.queryForObject(sql_selectOne_W, args,new WdcoupleRowMapper());
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
	WdcoupleVO selectOneD(WdcoupleVO vo) {
		Object[] args= {vo.getWdcdoori()};
		try {	
			return jdbcTemplate.queryForObject(sql_selectOne_D, args,new WdcoupleRowMapper());
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
}
class WdcoupleRowMapper implements RowMapper<WdcoupleVO> {

	 
	public WdcoupleVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WdcoupleVO data=new WdcoupleVO();
		data.setWdcpk(rs.getInt("WDCPK"));
		data.setWdcwoori(rs.getString("WDCWOORI"));
		data.setWdcdoori(rs.getString("WDCDOORI"));
		data.setWdcdate(rs.getString("WDCDATE"));
		return data;
	}
}