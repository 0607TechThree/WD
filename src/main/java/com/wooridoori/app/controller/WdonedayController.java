package com.wooridoori.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.model.image.WdimageService;
import com.wooridoori.app.model.image.WdimageVO;
import com.wooridoori.app.model.oneday.WdonedayService;
import com.wooridoori.app.model.oneday.WdonedayVO;

@Controller
public class WdonedayController {

	@Autowired
	private WdonedayService WdonedayService;
	@Autowired
	private WdimageService wdimageService;
	
	
	@RequestMapping("/selectOneWdoneday.do")
	public String selectOneWdoneday(WdonedayVO vo, WdimageVO ivo,Model model) {
		vo=WdonedayService.selectOneWdoneday(vo);
		model.addAttribute("onedaydata",vo);
		List<WdimageVO> datas=null;
		ivo.setWdopk(vo.getWdopk());
		datas=wdimageService.selectAllWdimage(ivo);
		model.addAttribute("imgdatas",datas);
		System.out.println(datas);
		return "onedaydetail.jsp"; 
	}
	
	@RequestMapping("/oneday.do")
	public String selectAllWdoneday(WdonedayVO vo, Model model) {
		List<WdonedayVO> datas=null;
		datas=WdonedayService.selectAllWdoneday(vo);
		System.out.println(datas);
		model.addAttribute("onedaydatas",datas);
		return "oneday.jsp";
	}
		
}
