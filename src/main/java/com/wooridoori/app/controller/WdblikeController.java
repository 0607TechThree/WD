package com.wooridoori.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.like.WdblikeService;
import com.wooridoori.app.like.WdblikeVO;

@Controller
public class WdblikeController {
	
	@Autowired
	private WdblikeService WdblikeService;
	
	@RequestMapping("/insert.do")
	public String insertWdlike(WdblikeVO vo) {
		WdblikeService.insertWdlike(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/update.do")
	public String updateWdlike(WdblikeVO vo) {
		WdblikeService.updateWdlike(vo);
		return "redirect:main.do";
	}
	
}
