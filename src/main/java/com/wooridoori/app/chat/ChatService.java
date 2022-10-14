package com.wooridoori.app.chat;

public interface ChatService {
	void insertChat(ChatVO vo);
	void deleteChat(ChatVO vo);
	ChatVO selectOne(ChatVO vo);
}
