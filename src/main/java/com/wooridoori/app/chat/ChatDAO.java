package com.wooridoori.app.chat;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("chatDAO")
public class ChatDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO CHAT(CHATPK,CHATPW) VALUES((SELECT NVL(MAX(CHATPK),0) +1 FROM CHAT),?)";
	final String sql_delete="DELETE FROM CHAT WHERE CHATPK=?";
	final String sql_selectOne="SELECT * FROM CHAT WHERE CHATPW = ?";
	final String sql_selectAll="SELECT * FROM CHAT";
	final String sql_count="SELECT COUNT(*) AS TOTAL FROM CHAT";
	
	void insertChat(ChatVO vo) {
		jdbcTemplate.update(sql_insert, vo.getChatpw());	
	}
	void deleteChat(ChatVO vo) {
		jdbcTemplate.update(sql_delete, vo.getChatpk());
	}
	
	List<ChatVO> selectAll(ChatVO vo) {
		try {	
			return jdbcTemplate.query(sql_selectAll,new ChatRowMapper());
		} catch (EmptyResultDataAccessException e){
			return null;
		}
	}
	
	Integer count(ChatVO vo) {
		try {	
			return jdbcTemplate.queryForObject(sql_count,Integer.class);
		} catch (EmptyResultDataAccessException e){
			return 0;
		}
	}
	
	ChatVO selectOne(ChatVO vo) {
		Object[] args= {vo.getChatpw()};
		return jdbcTemplate.queryForObject(sql_selectOne, args,new ChatRowMapper());
		
	}
}
class ChatRowMapper implements RowMapper<ChatVO> {

	public ChatVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ChatVO data=new ChatVO();
		data.setChatpk(rs.getInt("CHATPK"));
		data.setChatpw(rs.getString("CHATPW"));
		return data;
	}
}

