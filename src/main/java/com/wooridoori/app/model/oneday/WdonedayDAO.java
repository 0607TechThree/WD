package com.wooridoori.app.model.oneday;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("wdonedayDAO")
public class WdonedayDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_selectOne="SELECT * FROM WDONEDAY WHERE WDOPK = ?";
	final String sql_selectAll="SELECT * FROM WDONEDAY";
	final String sql_selectAll_RB = "SELECT * FROM (SELECT * FROM WDONEDAY ORDER BY WDOPK) WHERE ROWNUM <= 6";
//	final String sql_insert="INSERT INTO WDONEDAY VALUES((SELECT NVL(MAX(WDOPK),0) +1 FROM WDONEDAY),?,?,?,?)";
	final String sql_selectAll_PG = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM WDONEDAY ORDER BY WDOPK) A) WHERE RN > ? AND RN <= ?";
	final String sql_total = "SELECT COUNT(*) AS TOTAL FROM WDONEDAY";
	//	public void insertWdoneday(WdonedayVO vo) {
//		jdbcTemplate.update(sql_insert,vo.getWdoname(),vo.getWdoregion(),vo.getWdoaddress(),vo.getWdosubject());
//	}
	public WdonedayVO selectOneWdoneday(WdonedayVO vo) {
		Object[] args= {vo.getWdopk()};
		try {	
			return jdbcTemplate.queryForObject(sql_selectOne,args,new WdonedayRowMapper());
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
	public List<WdonedayVO> selectAllWdoneday(WdonedayVO vo) {
		return jdbcTemplate.query(sql_selectAll,new WdonedayRowMapper());
	}
	List<WdonedayVO> selectAWdoneday(WdonedayVO vo) {
        return jdbcTemplate.query(sql_selectAll_RB,new WdonedayRowMapper());
	}
	
	public List<WdonedayVO> selectPGWdoneday(WdonedayVO vo,int pageNum, int amount) {
		Object[] args= {(pageNum - 1) * amount , pageNum * amount};
        return jdbcTemplate.query(sql_selectAll_PG, args, new WdonedayRowMapper());
	}
	public Integer total(WdonedayVO vo) {
		try {	
			return jdbcTemplate.queryForObject(sql_total,Integer.class);
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
}
class WdonedayRowMapper implements RowMapper<WdonedayVO> {

	 
	public WdonedayVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WdonedayVO data=new WdonedayVO();
		data.setWdopk(rs.getInt("WDOPK"));
		data.setWdoname(rs.getString("WDONAME"));
		data.setWdoregion(rs.getString("WDOREGION"));
		data.setWdoaddress(rs.getString("WDOADDRESS"));
		data.setWdosubject(rs.getString("WDOSUBJECT"));
		data.setWdomainimg(rs.getString("WDOMAINIMG"));
		return data;
	}
}
