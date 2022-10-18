package com.wooridoori.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wooridoori.app.board.WdboardService;
import com.wooridoori.app.board.WdboardVO;
import com.wooridoori.app.chat.ChatService;
import com.wooridoori.app.chat.ChatVO;
import com.wooridoori.app.couple.WdcoupleService;
import com.wooridoori.app.couple.WdcoupleVO;
import com.wooridoori.app.model.member.WdmemberService;
import com.wooridoori.app.model.member.WdmemberVO;
import com.wooridoori.app.model.oneday.WdonedayService;
import com.wooridoori.app.model.oneday.WdonedayVO;

@Controller
@SessionAttributes("udata")
public class controller {
	@Autowired
	private WdboardService wdboardService;
	@Autowired
	private WdmemberService wdmemberService;
	@Autowired
	private WdonedayService wdonedayService;
	@Autowired
	private WdcoupleService wdcoupleService;
	@Autowired
	private ChatService chatService;
	
	@ModelAttribute("scMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> scMap=new HashMap<String,String>();
		scMap.put("제목", "TITLE");
		scMap.put("작성자", "WRITER");
		return scMap;
	}
	
	@RequestMapping(value="/main.do",method=RequestMethod.GET)
	public String index(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdonedayVO wdovo,WdboardVO wdbvo,Model model, ChatVO wsvo) {
		List<WdboardVO> brdatas=null;
		List<WdboardVO> bldatas=null;
		List<WdonedayVO> odatas=null;
		brdatas=wdboardService.selectAWdboard(wdbvo);
		bldatas=wdboardService.selectBWdboard(wdbvo);
		odatas=wdonedayService.selectAWdoneday(wdovo);
		model.addAttribute("brdatas", brdatas);
		model.addAttribute("bldatas", bldatas);
		model.addAttribute("odatas", odatas);
		int count = chatService.count(wsvo);
		model.addAttribute("wsdatacount", count);
		wsvo = chatService.selectOne(wsvo);
		System.out.println(wsvo);
		model.addAttribute("wsdata", wsvo);
		System.out.println(count);
		return "main.jsp";
	}
	@RequestMapping(value="/main.do",method=RequestMethod.POST)
	public String main(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdonedayVO wdovo,WdboardVO wdbvo,Model model, ChatVO wsvo) {
		List<WdboardVO> brdatas=null;
		List<WdboardVO> bldatas=null;
		List<WdonedayVO> odatas=null;
		brdatas=wdboardService.selectAWdboard(wdbvo);
		bldatas=wdboardService.selectBWdboard(wdbvo);
		odatas=wdonedayService.selectAWdoneday(wdovo);
		model.addAttribute("brdatas", brdatas);
		model.addAttribute("bldatas", bldatas);
		model.addAttribute("odatas", odatas);
		int count = chatService.count(wsvo);
		model.addAttribute("wsdatacount", count);
		wsvo = chatService.selectOne(wsvo);
		System.out.println(wsvo);
		model.addAttribute("wsdata", wsvo);
		System.out.println(count);
		return "main.jsp";
	}

	@RequestMapping("/login.do")
    public String selectOneMember(WdmemberVO wdmvo,HttpServletRequest request,HttpSession session,Model model,WdcoupleVO wdcvo) {
		String paramLocation=request.getParameter("location");
		//System.out.println("로그인 do1");
		wdmvo=wdmemberService.selectOneWdmember(wdmvo);
		//System.out.println("로그인 do2");
		if(wdmvo==null) {
			return "redirect:login.jsp";
		}
		else {
			session.setAttribute("udata", wdmvo);
			// 커플 조회
			wdcvo.setWdcwoori(wdmvo.getWdmid());
			wdcvo.setWdcdoori(wdmvo.getWdmid());
			if(wdcoupleService.selectOneW(wdcvo) != null) {	
				session.setAttribute("coupledata", wdmemberService.selectOneC(wdcoupleService.selectOneW(wdcvo).getWdcdoori()));
			}else if(wdcoupleService.selectOneD(wdcvo) != null){
				session.setAttribute("coupledata", wdmemberService.selectOneC(wdcoupleService.selectOneD(wdcvo).getWdcwoori()));
			}
			return paramLocation;
		}
    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:main.do";
    }
    
    @RequestMapping("/loginaction.do")
    public String loginaction(HttpServletRequest request,HttpSession session) {
    	String uri = request.getHeader("REFERER"); // 로그인을 누를 시 페이지의 주소를 저장
		System.out.println("uri : "+uri);
		String location = uri.substring(26); // uri에서 필요한 action만 자름
		System.out.println(location);
		
		request.setAttribute("location", location);

    	return "login.jsp";
    }
    
    @RequestMapping("dDayCar.do")
    public String dDayCarOpen() {
    	return "dDayCar.jsp";
    }
    
}
