package com.wooridoori.app.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("wdboardDAO")
public class WdboardDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_selectOne="SELECT * FROM WDBOARD WHERE WDBPK = ?";
	final String sql_selectPk="SELECT MAX(WDBPK) FROM WDBOARD";
	final String sql_selectAll_RB = "SELECT A.*,ROWNUM FROM (SELECT * FROM WDBOARD WHERE WDBOPEN = 0 ORDER BY WDBPK DESC) A WHERE ROWNUM <= 3";
//	final String sql_selectAll_RB = "SELECT * FROM (SELECT * FROM WDBOARD WHERE WDBOPEN = 0 ORDER BY WDBPK DESC) WHERE ROWNUM <= 3";
//	final String sql_selectAll_LB = "SELECT * FROM (SELECT * FROM WDBOARD WHERE WDBOPEN = 0 ORDER BY WDBLIKE DESC) WHERE ROWNUM <= 3";
	final String sql_selectAll_LB = "SELECT A.*,ROWNUM FROM (SELECT * FROM WDBOARD WHERE WDBOPEN = 0 ORDER BY WDBLIKE DESC) A WHERE ROWNUM <= 3";
	final String sql_insert="INSERT INTO WDBOARD(WDBPK,WDBWRITER,WDBTITLE,WDBCONTENT,WDBOPEN) VALUES((SELECT NVL(MAX(WDBPK),0) +1 FROM WDBOARD),?,?,?,?)";
	final String sql_delete="DELETE FROM WDBOARD WHERE WDBPK=?";
	final String sql_update="UPDATE WDBOARD SET WDBTITLE=?, WDBCONTENT=?, WDBOPEN=? WHERE WDBPK=?";
	final String sql_update_LU="UPDATE WDBOARD SET WDBLIKE=WDBLIKE+1 WHERE WDBPK=?";
	final String sql_update_LD="UPDATE WDBOARD SET WDBLIKE=WDBLIKE-1 WHERE WDBPK=?";
	final String sql_selectAll="SELECT * FROM WDBOARD ORDER BY WDBPK DESC";
	final String sql_searchTitle="SELECT * FROM WDBOARD WHERE WDBTITLE LIKE '%'||?||'%' ORDER BY WDBPK DESC";
	final String sql_searchWriter="SELECT * FROM WDBOARD WHERE WDBWRITER LIKE '%'||?||'%' ORDER BY WDBPK DESC";
	
	void insertWdboard(WdboardVO vo) {
		jdbcTemplate.update(sql_insert, vo.getWdbwriter(),vo.getWdbtitle(),vo.getWdbcontent(),vo.getWdbopen());	
	}
	void deleteWdboard(WdboardVO vo) {
		jdbcTemplate.update(sql_delete, vo.getWdbpk());
	}
	void updateWdboard(WdboardVO vo) {
		jdbcTemplate.update(sql_update,vo.getWdbtitle(),vo.getWdbcontent(),vo.getWdbopen(),vo.getWdbpk());
	}
	void updateWdblikeU(WdboardVO vo) {
		jdbcTemplate.update(sql_update_LU,vo.getWdbpk());
	}
	void updateWdblikeD(WdboardVO vo) {
		jdbcTemplate.update(sql_update_LD,vo.getWdbpk());
	}
	WdboardVO selectOne(WdboardVO vo) {
		Object[] args= {vo.getWdbpk()};
		try {
		return jdbcTemplate.queryForObject(sql_selectOne, args,new WdboardRowMapper());
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
	Integer selectOnePk(WdboardVO vo) {
		try {	
			return jdbcTemplate.queryForObject(sql_selectPk,Integer.class);
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
	List<WdboardVO> selectAllBoard(WdboardVO vo) {
		if(vo.getWdbtitle() != null) {
			Object[] args= {vo.getWdbtitle()};			
			return jdbcTemplate.query(sql_searchTitle,args,new WdboardRowMapper());
		}else if(vo.getWdbwriter() != null) {
			Object[] args= {vo.getWdbwriter()};			
			return jdbcTemplate.query(sql_searchWriter,args,new WdboardRowMapper());
		}else {
			return jdbcTemplate.query(sql_selectAll,new WdboardRowMapper());
		}
	}
	List<WdboardVO> selectABoard(WdboardVO vo) {
			return jdbcTemplate.query(sql_selectAll_RB,new WdboardRowMapper2());
	}
	List<WdboardVO> selectBBoard(WdboardVO vo) {
		return jdbcTemplate.query(sql_selectAll_LB,new WdboardRowMapper2());
	}
}
class WdboardRowMapper implements RowMapper<WdboardVO> {

	public WdboardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WdboardVO data=new WdboardVO();
		data.setWdbpk(rs.getInt("WDBPK"));
		data.setWdbwriter(rs.getString("WDBWRITER"));
		data.setWdbtitle(rs.getString("WDBTITLE"));
		data.setWdbcontent(rs.getString("WDBCONTENT"));
		data.setWdblike(rs.getInt("WDBLIKE"));
		data.setWdbopen(rs.getInt("WDBOPEN"));
		Random rd = new Random();
		int rand = rd.nextInt(6)+1;
		data.setWdbrandom(rand);
		return data;
	}
	
}

class WdboardRowMapper2 implements RowMapper<WdboardVO> {

	public WdboardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WdboardVO data=new WdboardVO();
		data.setWdbpk(rs.getInt("WDBPK"));
		data.setWdbwriter(rs.getString("WDBWRITER"));
		data.setWdbtitle(rs.getString("WDBTITLE"));
		data.setWdbcontent(rs.getString("WDBCONTENT"));
		data.setWdblike(rs.getInt("WDBLIKE"));
		data.setWdbopen(rs.getInt("WDBOPEN"));
		data.setWdbrandom(rs.getInt("ROWNUM"));
		return data;
	}
	
}