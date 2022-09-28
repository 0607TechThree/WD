package com.wooridoori.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.model.image.WdimageService;
import com.wooridoori.app.model.image.WdimageVO;

@Controller
public class WdimageController {

	@Autowired
	private WdimageService WdimageService;
	
	@RequestMapping("/selectAllWdimage")
	public String selectAllWdimage(WdimageVO vo){
		List<WdimageVO> datas=null;
		datas=WdimageService.selectAllWdimage(vo);
		return "redirect:main.do";
	}

}