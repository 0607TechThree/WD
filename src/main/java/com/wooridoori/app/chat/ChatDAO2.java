package com.wooridoori.app.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.wooridoori.app.crawling.JDBCUtil;

public class ChatDAO2 {
	private Connection conn;
	private PreparedStatement pstmt;
	
	final String sql_delete="DELETE FROM CHAT WHERE CHATPK=1";
	
	public void delete(ChatVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
	}
}
