package com.wooridoori.app.controller;

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
	public String insertWdcouple(WdcoupleVO vo){
		WdcoupleService.insertWdcouple(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/deleteWdcouple.do")
	public String deleteWdcouple(WdcoupleVO vo){
		WdcoupleService.deleteWdcouple(vo);
		return "redirect:main.do";
	}
	
}
