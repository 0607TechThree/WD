package com.wooridoori.app.mail;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

//@Service("emailService")
public class EmailServiceImpl implements EmailService {

	//@Resource(name="emailDao")
	EmailDAO dao;
	
	public void setdao(EmailDAO dao) {
		this.dao = dao;
	}
}
