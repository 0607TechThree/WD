package com.wooridoori.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.model.member.WdmemberService;
import com.wooridoori.app.model.member.WdmemberVO;


@Controller
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
		return "redirect:main.do";
	}
}
