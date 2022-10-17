package com.wooridoori.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.couple.WdcoupleService;
import com.wooridoori.app.couple.WdcoupleVO;

@Controller
public class WdcoupleController {

	@Autowired
	private WdcoupleService WdcoupleService;
	
	@RequestMapping("/insertWdcouple.do")
	public String insertWdcouple(WdcoupleVO vo,HttpSession session){
		WdcoupleService.insertWdcouple(vo);
		session.invalidate();
		return "closeCoupleCheck.jsp";
	}
	
	@RequestMapping("/deleteWdcouple.do")
	public String deleteWdcouple(WdcoupleVO vo,HttpSession session){
		WdcoupleService.deleteWdcouple(vo);
		session.invalidate();
		return "redirect:main.do";
	}
	
}
