package com.wooridoori.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.app.board.WdboardService;
import com.wooridoori.app.board.WdboardVO;

@Controller
public class WdboardController {

	@Autowired
	private WdboardService WdboardService;
	
	@ModelAttribute("scMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> scMap=new HashMap<String,String>();
		scMap.put("제목", "TITLE");
		scMap.put("작성자", "WRITER");
		return scMap;
	}
	
	@RequestMapping("/insertWdboard.do")
	public String insertWdboard(WdboardVO vo,Model model) {
		WdboardService.insertWdboard(vo);
		model.addAttribute("data", vo);
		return "boarddetail.jsp";
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
	public String selectAllBoard(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdboardVO vo, Model model) {
		List<WdboardVO> datas=null;
		if(!(searchContent.equals("") || searchContent.equals(null))) {
			if(searchCondition.equals("TITLE") || searchCondition.equals("제목")) {
				vo.setWdbtitle(searchContent);
			}else {
				vo.setWdbwriter(searchContent);
			}	
		}
		datas=WdboardService.selectAllWdboard(vo);
		System.out.println(datas);
		model.addAttribute("boarddatas",datas);
		return "board.jsp";
	}
	
	@RequestMapping("/selectOneWdboard.do")
	public String selectOneWdboard(WdboardVO vo, Model model) {
		vo=WdboardService.selectOneWdboard(vo);
		model.addAttribute("boarddata",vo);
		return "boarddetail.jsp";
	}
	
}
