package com.wooridoori.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.app.model.image.WdimageService;
import com.wooridoori.app.model.image.WdimageVO;
import com.wooridoori.app.model.oneday.PageVO;
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
	/*
	@RequestMapping("/oneday.do")
	public String selectAllWdoneday(WdonedayVO vo, Model model) {
		List<WdonedayVO> datas=null;
		datas=WdonedayService.selectAllWdoneday(vo);
		System.out.println(datas);
		model.addAttribute("onedaydatas",datas);
		return "oneday.jsp";
	}
	*/
	@RequestMapping("/oneday.do")
	public String selectPGWdoneday(WdonedayVO vo, Model model,HttpServletRequest request) {
		List<WdonedayVO> datas=null;
		int pageNum = 1;
		int amount = 12;
		if(request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		datas=WdonedayService.selectPGWdoneday(vo,pageNum, amount);
		int total = WdonedayService.total(vo);
		PageVO pageVO = new PageVO(pageNum, amount, total);
		System.out.println(datas);
		System.out.println(pageVO);
		// 3. 페이지네이션을 화면에 전달
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("onedaydatas",datas);
		return "oneday.jsp";
	}
}
