package com.wooridoori.app.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MailSend {
	@RequestMapping("/sendMail.do")
	public String MailSend(HttpServletRequest request) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
	    prop.put("mail.smtp.auth", "true");
	    prop.put("mail.smtp.port", "587");
	    prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
	    
	    Authenticator auth = new MailAuth();
	    
	    Session session = Session.getDefaultInstance(prop, auth);
	    
	    MimeMessage msg = new MimeMessage(session);
	    
	    try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("codecu6@gmail.com", "WooriDoori@Tech.Three"));
			InternetAddress to = new InternetAddress(request.getParameter("address"));
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("WooriDoori 커플 정보 확인 메세지 입니다.", "UTF-8");
			msg.setText(
					"\n"+
					"WooriDoori입니다."
					+"\n"
					+request.getParameter("wdcwoori")+ "님과 커플이 되고싶다면 아래의 링크를 클릭해주세요."
					+"\n"
					+"http://localhost:8088/app/couplecheck.jsp?wdcwoori="+request.getParameter("wdcwoori")+
					"\n"
					, "UTF-8");
			
			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	    return "closeMail.jsp";
	}
}
