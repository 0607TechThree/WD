package com.wooridoori.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooridoori.app.board.WdboardService;
import com.wooridoori.app.board.WdboardVO;
import com.wooridoori.app.like.WdblikeService;
import com.wooridoori.app.like.WdblikeVO;

@Controller
public class WdblikeController {
	
	@Autowired
	private WdblikeService WdblikeService;
	@Autowired
	private WdboardService WdboardService;
	
	@RequestMapping("/insertwdlike.do")
	public String insertWdlike(HttpServletRequest request,WdblikeVO vo,WdboardVO wdbvo, Model model) {
		System.out.println(vo);
		System.out.println(wdbvo);
		WdblikeService.insertWdlike(vo);
		wdbvo.setWdbpk(vo.getWdbpk());
		WdboardService.updateWdboardlikeU(wdbvo);
		vo=WdblikeService.selectOneWdlike(vo);
		return "redirect:selectOneWdboard.do?wdbpk="+wdbvo.getWdbpk();
	}
	
	@RequestMapping("/updatewdlike.do")
	public String updateWdlike(HttpServletRequest request,WdblikeVO vo,WdboardVO wdbvo, Model model) {
		WdblikeService.updateWdlike(vo);
		wdbvo.setWdbpk(vo.getWdbpk());
		vo=WdblikeService.selectOneWdlike(vo);
		if(vo.getWdcheck() == 0) {
			WdboardService.updateWdboardlikeU(wdbvo);
		}else {
			WdboardService.updateWdboardlikeD(wdbvo);
		}
		return "redirect:selectOneWdboard.do?wdbpk="+wdbvo.getWdbpk();
	}

}
