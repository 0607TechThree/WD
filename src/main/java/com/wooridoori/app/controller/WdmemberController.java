package com.wooridoori.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wooridoori.app.model.member.WdmemberService;
import com.wooridoori.app.model.member.WdmemberVO;


@Controller
@SessionAttributes("udata")
public class WdmemberController {

	@Autowired
	private WdmemberService WdmemberService;
	
	@RequestMapping("/insertWdmember.do")
	public String insertWdmember(WdmemberVO vo) {
		WdmemberService.insertWdmember(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateWdmember.do")
	public String updateWdmember(WdmemberVO vo) {
		WdmemberService.updateWdmember(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/deleteWdmember.do")
	public String deleteWdmember(WdmemberVO vo) {
		WdmemberService.deleteWdmember(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/selectOneWdmember.do")
	public String selectOne(WdmemberVO vo) {
		vo=WdmemberService.selectOneWdmember(vo);
		return "main.do";
	}
	
	@RequestMapping("/snslogin.do")
	public String snslogin(WdmemberVO vo, HttpSession session,Model model,HttpServletRequest request) {
		String paramkemail = null;
		String paramnemail = null;
		String paramLocation = (String) session.getAttribute("location");
		if(request.getParameter("kemail") != null) {
			paramkemail = request.getParameter("kemail");
			request.setAttribute("kemail", paramkemail);
			vo.setKemail(paramkemail);
		}else{
			paramnemail = request.getParameter("nemail");
			request.setAttribute("nemail", paramnemail);
			vo.setNemail(paramnemail);
		}

		vo=WdmemberService.selectOneWdmember(vo);
		System.out.println("snslogaction에서의 tuvo "+vo);
		if(vo==null) {
			return "joinfirst.jsp";
		}else {
			session.setAttribute("udata", vo); // 로그인한 회원정보
			return paramLocation;
		}
	}
}
