package com.wooridoori.app.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ChatService")
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;

	public void insertChat(ChatVO vo) {
		chatDAO.insertChat(vo);
		
	}

	public void deleteChat(ChatVO vo) {
		chatDAO.deleteChat(vo);
		
	}

	public ChatVO selectOne(ChatVO vo) {
		return chatDAO.selectOne(vo);
	}

	public List<ChatVO> selectAll(ChatVO vo) {
		return chatDAO.selectAll(vo);
	}
	
	public Integer count(ChatVO vo) {
		return chatDAO.count(vo);
	}


}
