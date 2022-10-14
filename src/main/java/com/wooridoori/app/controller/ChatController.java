package com.wooridoori.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.chat.ChatService;
import com.wooridoori.app.chat.ChatVO;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chatinsert.do")
	public String insert(ChatVO vo) {
		chatService.insertChat(vo);
		return "";
	}
	
	@RequestMapping("/chatdelete.do")
	public String delete(ChatVO vo) {
		chatService.deleteChat(vo);
		return "";
	}
	
	@RequestMapping("/chatselectOne.do")
	public String selectOne(ChatVO vo) {
		if(chatService.selectOne(vo) != null) {
			
		}
		return "";
	}
}
