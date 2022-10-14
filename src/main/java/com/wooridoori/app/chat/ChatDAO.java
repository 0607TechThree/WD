package com.wooridoori.app.chat;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class ChatDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO CHAT(CHATPK,CHATPW) VALUES((SELECT NVL(MAX(CHATPK),0) +1 FROM CHAT),?)";
	final String sql_delete="DELETE FROM CHAT WHERE CHATPK=?";
	final String sql_selectOne="SELECT * FROM CHAT WHERE CHATPW = ?";
	
	void insertChat(ChatVO vo) {
		jdbcTemplate.update(sql_insert, vo.getChatpw());	
	}
	void deleteChat(ChatVO vo) {
		jdbcTemplate.update(sql_delete, vo.getChatpk());
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
		data.setChatpw(rs.getInt("CHATPW"));
		return data;
	}
}