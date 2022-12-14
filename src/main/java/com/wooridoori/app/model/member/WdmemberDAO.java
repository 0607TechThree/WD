package com.wooridoori.app.model.member;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


public class WdmemberDAO {

	private JdbcTemplate jdbcTemplate;
	
	final String sql_selectOne="SELECT * FROM WDMEMBER WHERE WDMID=? AND WDMPW=?";
	final String sql_insert="INSERT INTO WDMEMBER VALUES((SELECT NVL(MAX(WDMPK),0) +1 FROM WDMEMBER),?,?,?,?,?,?,?,?,?)";
	final String sql_update="UPDATE WDMEMBER SET WDMMBTI=? AND WDMNICK=? WHERE WDMID=?";
	final String sql_delete="DELETE FROM WDMEMBER WHERE WDMID=?";
	final String sql_checkId="SELECT * FROM WDMEMBER WHERE WDMID=?";
	final String sql_vipupdate="UPDATE WDMEMBER SET WDMVIP=1 WHERE WDMID=?";
	
	void insertWdmember(WdmemberVO vo) {
		if(vo.getNemail() == null && vo.getKemail() == null) {
			vo.setNemail("-");
			vo.setKemail("-");
		}else if(vo.getKemail() == null) {
			vo.setKemail("-");
		}else {
			vo.setNemail("-");
		}
		jdbcTemplate.update(sql_insert,vo.getWdmid(),vo.getWdmpw(),vo.getWdmnick(),vo.getWdmemail(),vo.getWdmgender(),vo.getWdmmbti(),vo.getNemail(),vo.getKemail(),vo.getWdmvip());
	}
	void vipupdate(WdmemberVO vo) {
		jdbcTemplate.update(sql_vipupdate,vo.getWdmid());
	}
	void updateWdmember(WdmemberVO vo) {
		jdbcTemplate.update(sql_update,vo.getWdmmbti(),vo.getWdmnick(),vo.getWdmid());
	}
	void deleteWdmember(WdmemberVO vo) {
		jdbcTemplate.update(sql_delete,vo.getWdmid());
	}
	WdmemberVO checkId(WdmemberVO vo) {
		Object[] args= {vo.getWdmpk()};
		return jdbcTemplate.queryForObject(sql_checkId,args,new WdmemberRowMapper());
	}
	WdmemberVO selectOne(WdmemberVO vo) {
		Object[] args= {vo.getWdmid(),vo.getWdmpw()};
		return jdbcTemplate.queryForObject(sql_selectOne,args,new WdmemberRowMapper());
	}
}
class WdmemberRowMapper implements RowMapper<WdmemberVO> {

	 
	public WdmemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WdmemberVO data=new WdmemberVO();
		data.setWdmpk(rs.getInt("WDMPK"));
		data.setWdmid(rs.getString("WDMID"));
		data.setWdmpw(rs.getString("WDMPW"));
		data.setWdmnick(rs.getString("WDMNICK"));
		data.setWdmemail(rs.getString("WDMEMAIL"));
		data.setWdmgender(rs.getString("WDMGENDER"));
		data.setWdmmbti(rs.getString("WDMMBTI"));
		data.setNemail(rs.getString("NEMAIL"));
		data.setKemail(rs.getString("KEMAIL"));
		data.setWdmvip(rs.getInt("WDMVIP"));
		return data;
	}
}