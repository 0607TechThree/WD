package com.wooridoori.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.model.oneday.WdonedayService;
import com.wooridoori.app.model.oneday.WdonedayVO;

@Controller
public class WdonedayController {

	@Autowired
	private WdonedayService WdonedayService;
	
	@RequestMapping("/selectOneWdoneday")
	public String selectOneWdoneday(WdonedayVO vo) {
		vo=WdonedayService.selectOneWdoneday(vo);
		return "redirect:main.do"; 
	}
	
	@RequestMapping("/selectAllWdoneday")
	public String selectAllWdoneday(WdonedayVO vo) {
		List<WdonedayVO> datas=null;
		datas=WdonedayService.selectAllWdoneday(vo);
		return "redirect:main.do";
	}
}
