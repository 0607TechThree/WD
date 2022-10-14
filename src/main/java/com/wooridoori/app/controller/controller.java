package com.wooridoori.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
	
	@ModelAttribute("scMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> scMap=new HashMap<String,String>();
		scMap.put("제목", "TITLE");
		scMap.put("작성자", "WRITER");
		return scMap;
	}
	
	@RequestMapping(value="/main.do",method=RequestMethod.GET)
	public String index(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdonedayVO wdovo,WdboardVO wdbvo,Model model) {
		List<WdboardVO> brdatas=null;
		List<WdboardVO> bldatas=null;
		List<WdonedayVO> odatas=null;
		brdatas=wdboardService.selectAWdboard(wdbvo);
		bldatas=wdboardService.selectBWdboard(wdbvo);
		odatas=wdonedayService.selectAWdoneday(wdovo);
		model.addAttribute("brdatas", brdatas);
		model.addAttribute("bldatas", bldatas);
		model.addAttribute("odatas", odatas);
		return "main.jsp";
	}
	@RequestMapping(value="/main.do",method=RequestMethod.POST)
	public String main(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdonedayVO wdovo,WdboardVO wdbvo,Model model) {
		List<WdboardVO> brdatas=null;
		List<WdboardVO> bldatas=null;
		List<WdonedayVO> odatas=null;
		brdatas=wdboardService.selectAWdboard(wdbvo);
		bldatas=wdboardService.selectBWdboard(wdbvo);
		odatas=wdonedayService.selectAWdoneday(wdovo);
		model.addAttribute("brdatas", brdatas);
		model.addAttribute("bldatas", bldatas);
		model.addAttribute("odatas", odatas);
		return "main.jsp";
	}

	@RequestMapping(value="/imageUpload.do",method=RequestMethod.POST)
	public String boardinsert(WdboardVO wdbvo,HttpServletRequest request,Model model) throws IllegalStateException, IOException {
		//System.out.println("로그: 오냐?");
//		String base64 = request.getParameter("fileData1");
//		String imageDataBytes = base64.split(",")[1];
//		System.out.println(imageDataBytes);
//		String fileName = request.getParameter("fileName");
//		String content = request.getParameter("form");
//		byte[] imageBytes = Base64.decodeBase64(imageDataBytes);
//		BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imageBytes));
//
//		System.out.println(bufImg);
//		ImageIO.write(bufImg, "jpg", new File("D:\\0607KIM\\workspace\\WD\\src\\main\\webapp\\img\\ck\\"+fileName));
//		wdbvo.setFileName(fileName);
		wdbvo.setWdbwriter("1");
		wdbvo.setWdbtitle("1");
		
		wdboardService.insertWdboard(wdbvo);
//		System.out.println(wdbvo);
		model.addAttribute("data", wdbvo);
		return "boarddetail.jsp";
	}
	
	@RequestMapping("/login.do")
    public String selectOneMember(WdmemberVO wdmvo,HttpServletRequest request,HttpSession session,Model model,WdcoupleVO wdcvo) {
		String paramLocation=request.getParameter("location");
		System.out.println("로그인 do1");
		wdmvo=wdmemberService.selectOneWdmember(wdmvo);
		System.out.println("로그인 do2");
		if(wdmvo==null) {
			return "redirect:login.jsp";
		}
		else {
			session.setAttribute("udata", wdmvo);
			/*
			
			
			// 커플 조회
			wdcvo.setWdcwoori(wdmvo.getWdmid());
			//wdcvo.setWdcdoori(wdmvo.getWdmid());
			System.out.println("세팅완료");
			System.out.println("wdcvo = " + wdcvo);
			System.out.println("셀렉원" + wdcoupleService.selectOneW(wdcvo));
			System.out.println();
			if(wdcoupleService.selectOneW(wdcvo) != null) {				
				System.out.println("1번 if 문 전");
				session.setAttribute("coupledata", wdmemberService.selectOneC(wdcoupleService.selectOneW(wdcvo).getWdcdoori()));
				System.out.println("1번 if 문 후");
			}else if(wdcoupleService.selectOneD(wdcvo) != null){
				System.out.println("2번 if 문 전");
				session.setAttribute("coupledata", wdmemberService.selectOneC(wdcoupleService.selectOneW(wdcvo).getWdcwoori()));
				System.out.println("2번 if 문 후");
			}
			
			System.out.println("if 문 지나침");
			// chat 비밀번호 설정
			if(request.getParameter("chatpw") != null) {
				// application.setAttribute("chatpw", request.getParameter("chatpw"));
			}
			System.out.println("챗 지나침");
			 */
			
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
