package com.wooridoori.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wooridoori.app.couple.WdcoupleService;
import com.wooridoori.app.couple.WdcoupleVO;
import com.wooridoori.app.model.member.WdmemberService;
import com.wooridoori.app.model.member.WdmemberVO;


@Controller
@SessionAttributes("udata")
public class WdmemberController {

	@Autowired
	private WdmemberService WdmemberService;
	@Autowired
	private WdcoupleService wdcoupleService;
	
	@RequestMapping("/insertWdmember.do")
	public String insertWdmember(WdmemberVO vo) {
		WdmemberService.insertWdmember(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateWdmember.do")
	public String updateWdmember(WdmemberVO vo, HttpSession session) {
		WdmemberService.updateWdmember(vo);
		session.invalidate();
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
	@RequestMapping("/vipupdate.do")
	public String vipupdate(WdmemberVO vo, HttpSession session) {
		vo = (WdmemberVO)session.getAttribute("udata");
		WdmemberService.vipupdate(vo);
		vo = WdmemberService.selectOneWdmember(vo);
		session.setAttribute("udata", vo);

		return "close.jsp";
	}
	@RequestMapping("/mypage.do")
	public String mypage(WdmemberVO vo,Model model,WdcoupleVO wdcvo,HttpSession session) {
		vo = (WdmemberVO)session.getAttribute("udata");
		wdcvo.setWdcwoori(vo.getWdmid());
		wdcvo.setWdcdoori(vo.getWdmid());
		System.out.println("wdcvo = " + wdcvo);
		System.out.println(wdcoupleService.selectOneW(wdcvo));
		System.out.println(wdcoupleService.selectOneD(wdcvo));
		if(wdcoupleService.selectOneW(wdcvo) != null) {				
			System.out.println("my1번 if 문 전");
			System.out.println(wdcoupleService.selectOneW(wdcvo));
			System.out.println("my1번 if 문 후");
			model.addAttribute("coupleinfo", wdcoupleService.selectOneW(wdcvo));
		}else if(wdcoupleService.selectOneD(wdcvo) != null){
			System.out.println("my2번 if 문 전");
			System.out.println(wdcoupleService.selectOneD(wdcvo));
			System.out.println("my2번 if 문 후");
			model.addAttribute("coupleinfo", wdcoupleService.selectOneD(wdcvo));
		}
		return "mypage.jsp";
	}
	@ResponseBody
	@RequestMapping(value="/checkId.do",method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public WdmemberVO checkId(WdmemberVO vo) {
		System.out.println(vo);
		vo=WdmemberService.checkId(vo);
		return vo;
	}
	
}
