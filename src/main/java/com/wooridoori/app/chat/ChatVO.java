package com.wooridoori.app.chat;

public class ChatVO {
	int chatpk;
	String chatpw;
	public int getChatpk() {
		return chatpk;
	}
	public void setChatpk(int chatpk) {
		this.chatpk = chatpk;
	}
	public String getChatpw() {
		return chatpw;
	}
	public void setChatpw(String chatpw) {
		this.chatpw = chatpw;
	}
	@Override
	public String toString() {
		return "ChatVO [chatpk=" + chatpk + ", chatpw=" + chatpw + "]";
	}

	
}
