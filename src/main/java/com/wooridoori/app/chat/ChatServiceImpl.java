package com.wooridoori.app.chat;

import org.springframework.beans.factory.annotation.Autowired;

public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;

	@Override
	public void insertChat(ChatVO vo) {
		chatDAO.insertChat(vo);
		
	}

	@Override
	public void deleteChat(ChatVO vo) {
		chatDAO.deleteChat(vo);
		
	}

	@Override
	public ChatVO selectOne(ChatVO vo) {
		return chatDAO.selectOne(vo);
	}

}
