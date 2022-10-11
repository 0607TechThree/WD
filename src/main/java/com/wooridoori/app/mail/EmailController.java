package com.wooridoori.app.mail;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmailController {
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	@Autowired
    private JavaMailSender mailSender;
	
	@Resource(name="emailService")
	EmailServiceImpl service;
	
	@RequestMapping("/sendmail.do")
	public String sendEmailAction(@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
		String e_mail = (String) paramMap.get("wdmemail");
		
		System.out.println(emailSender);
		System.out.println(email);
		System.out.println(mailSender);
		if (e_mail != null) {
			// 여기에 메일에 들어갈 내용을 입력한다.
			email.setSubject("제목"); // 제목
			email.setContent("내용"); // 내용
			email.setReceiver(e_mail);
			emailSender.SendEmail(mailSender, email); // 보내기
			
			model.addAttribute("errType", "mailSendingComplete");			
			return "common/Message.tiles";
			
		} else {
			// 메시지 띄우고 해당 페이지 그대로 놔두기
			model.addAttribute("errType", "mailSendingFail");		
			return "common/Message.tiles";
		}
	}
}
