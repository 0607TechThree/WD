package com.wooridoori.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String insertWdlike(WdblikeVO vo,WdboardVO wdbvo) {
		WdblikeService.insertWdlike(vo);
		wdbvo.setWdbpk(vo.getWdbpk());
		WdboardService.updateWdboardlikeU(wdbvo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/selectOnewdlike.do")
	public String selectOne(WdblikeVO vo) {
		WdblikeService.selectOneWdlike(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updatewdlike.do")
	public String updateWdlike(WdblikeVO vo,WdboardVO wdbvo) {
		WdblikeService.updateWdlike(vo);
		wdbvo.setWdbpk(vo.getWdbpk());
		if(vo.getWdbpk() == 0) {
			WdboardService.updateWdboardlikeD(wdbvo);
		}else {
			WdboardService.updateWdboardlikeU(wdbvo);
		}
		return "redirect:main.do";
	}
	
}
