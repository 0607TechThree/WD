package com.wooridoori.app.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	
	PasswordAuthentication pa;
	public MailAuth() {
		String mail_id = "codecu6@gmail.com";
		String mail_pw = "deziusxrmkuojvrv";
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
		}
}
