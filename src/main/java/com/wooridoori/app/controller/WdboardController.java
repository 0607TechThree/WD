package com.wooridoori.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.board.WdboardService;
import com.wooridoori.app.board.WdboardVO;

@Controller
public class WdboardController {

	@Autowired
	private WdboardService WdboardService;
	
	@RequestMapping("/insertWdboard.do")
	public String insertWdboard(WdboardVO vo) {
		WdboardService.insertWdboard(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/deleteWdboard.do")
	public String deleteWdboard(WdboardVO vo) {
		WdboardService.deleteWdboard(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateWdboard.do")
	public String updateWdboard(WdboardVO vo) {
		WdboardService.updateWdboard(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateWdblikeU.do")
	public String updateWdblikeU(WdboardVO vo) {
		WdboardService.updateWdboardlikeU(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateWdblikeD.do")
	public String updateWdblikeD(WdboardVO vo) {
		WdboardService.updateWdboardlikeD(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/board.do")
	public String selectAllBoard(WdboardVO vo) {
		List<WdboardVO> datas=null;
		datas=WdboardService.selectAllWdboard(vo);
		return "board.jsp";
	}
	
	@RequestMapping("/selectOneWdboard.do")
	public String selectOneWdboard(WdboardVO vo) {
		vo=WdboardService.selectOneWdboard(vo);
		return "board.jsp";
	}
	
}
