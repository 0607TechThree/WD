package com.wooridoori.app.chat;

import java.util.List;

public interface ChatService {
	void insertChat(ChatVO vo);
	void deleteChat(ChatVO vo);
	ChatVO selectOne(ChatVO vo);
	List<ChatVO> selectAll(ChatVO vo);
	Integer count(ChatVO vo);
}
