package com.wooridoori.app.controller;

import javax.servlet.http.HttpServletRequest;

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
	public String insertWdlike(HttpServletRequest request,WdblikeVO vo,WdboardVO wdbvo) {
		String uri = request.getHeader("REFERER"); // 거치기 전 페이지의 주소를 저장
		System.out.println("uri : "+uri);
		String location = uri.substring(26); // uri에서 필요한 action만 자름
		System.out.println(location);
		System.out.println(vo);
		System.out.println(wdbvo);
		WdblikeService.insertWdlike(vo);
		wdbvo.setWdbpk(vo.getWdbpk());
		WdboardService.updateWdboardlikeU(wdbvo);
		return "board.do";
	}
	
	@RequestMapping("/updatewdlike.do")
	public String updateWdlike(HttpServletRequest request,WdblikeVO vo,WdboardVO wdbvo) {
		String uri = request.getHeader("REFERER"); // 거치기 전 페이지의 주소를 저장
		System.out.println("uri : "+uri);
		String location = uri.substring(26); // uri에서 필요한 action만 자름
		System.out.println(location);
		
		WdblikeService.updateWdlike(vo);
		wdbvo.setWdbpk(vo.getWdbpk());
		if(vo.getWdbpk() == 0) {
			WdboardService.updateWdboardlikeD(wdbvo);
		}else {
			WdboardService.updateWdboardlikeU(wdbvo);
		}
		return location;
	}

}
