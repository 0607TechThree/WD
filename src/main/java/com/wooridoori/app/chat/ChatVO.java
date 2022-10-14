package com.wooridoori.app.chat;

public class ChatVO {
	int chatpk;
	int chatpw;
	public int getChatpk() {
		return chatpk;
	}
	public void setChatpk(int chatpk) {
		this.chatpk = chatpk;
	}
	public int getChatpw() {
		return chatpw;
	}
	public void setChatpw(int chatpw) {
		this.chatpw = chatpw;
	}
	@Override
	public String toString() {
		return "ChatVO [chatpk=" + chatpk + ", chatpw=" + chatpw + "]";
	}
	
}
