package com.wooridoori.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.app.board.WdboardService;
import com.wooridoori.app.board.WdboardVO;
import com.wooridoori.app.like.WdblikeService;
import com.wooridoori.app.like.WdblikeVO;
import com.wooridoori.app.model.member.WdmemberVO;

@Controller
public class WdboardController {

	@Autowired
	private WdboardService WdboardService;
	@Autowired
	private WdblikeService WdblikeService;
	
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
		WdboardService.selectOnePk(vo);

		return "redirect:selectOneWdboard.do?wdbpk="+WdboardService.selectOnePk(vo);
	}
	
	@RequestMapping("/deleteWdboard.do")
	public String deleteWdboard(WdboardVO vo) {
		WdboardService.deleteWdboard(vo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/updateWdboard.do")
	public String updateWdboard(WdboardVO vo) {
		System.out.println(vo);
		WdboardService.updateWdboard(vo);
		return "selectOneWdboard.do";
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
	public String selectOneWdboard(WdboardVO vo, Model model,WdblikeVO wdblvo,HttpSession session,WdmemberVO wdmvo) {
		vo=WdboardService.selectOneWdboard(vo);
		model.addAttribute("boarddata",vo);
		System.out.println("if문 실행 전");
		if(session.getAttribute("udata") != null) {
			System.out.println("if문 안쪽으로");
			wdmvo = (WdmemberVO) session.getAttribute("udata");			
			wdblvo.setWdbpk(vo.getWdbpk());
			wdblvo.setWdmpk(wdmvo.getWdmpk());		
			wdblvo=WdblikeService.selectOneWdlike(wdblvo);
			model.addAttribute("likedata",wdblvo);
		}
		return "boarddetail.jsp";
	}
	
}
