package com.wooridoori.app.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
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
import com.wooridoori.app.model.member.WdmemberService;
import com.wooridoori.app.model.member.WdmemberVO;

@Controller
@SessionAttributes("udata")
public class controller {
	@Autowired
	private WdboardService wdboardService;
	@Autowired
	private WdmemberService wdmemberService;
	
	@ModelAttribute("scMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> scMap=new HashMap<String,String>();
		scMap.put("제목", "TITLE");
		scMap.put("작성자", "WRITER");
		scMap.put("내용", "CONTENT");
		return scMap;
	}
	
	@RequestMapping(value="/main.do",method=RequestMethod.GET)
	public String index(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdboardVO wdbvo,Model model) {
		List<WdboardVO> datas=null;
		if(!(searchContent.equals("") || searchContent.equals(null))) {
			if(searchCondition.equals("TITLE") || searchCondition.equals("제목")) {
				wdbvo.setWdbtitle(searchContent);
			}else if(searchCondition.equals("WRITER") || searchCondition.equals("작성자")){
				wdbvo.setWdbwriter(searchContent);
			}	
			else {
				wdbvo.setSearchContent(searchContent);
			}
		}
		datas=wdboardService.selectAllWdboard(wdbvo);
		model.addAttribute("datas", datas);
		return "main.jsp";
	}
	@RequestMapping(value="/main.do",method=RequestMethod.POST)
	public String main(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String searchCondition,@RequestParam(value="searchContent",defaultValue="",required=false)String searchContent,WdboardVO wdbvo,Model model) {
		List<WdboardVO> datas=null;
		if(!(searchContent.equals("") || searchContent.equals(null))) {
			if(searchCondition.equals("TITLE") || searchCondition.equals("제목")) {
				wdbvo.setWdbtitle(searchContent);
			}else if(searchCondition.equals("WRITER") || searchCondition.equals("작성자")){
				wdbvo.setWdbwriter(searchContent);
			}	
			else {
				wdbvo.setSearchContent(searchContent);
			}
		}
		datas=wdboardService.selectAllWdboard(wdbvo);
		model.addAttribute("datas", datas);
		return "main.jsp";
	}

	@RequestMapping(value="/imageUpload.do",method=RequestMethod.POST)
	public String boardinsert(WdboardVO wdbvo,HttpServletRequest request,Model model) throws IllegalStateException, IOException {
		//System.out.println("로그: 오냐?");
		System.out.println(request.getParameter("form"));
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
		wdbvo.setWdbcontent(request.getParameter("form"));
		wdbvo.setWdbwriter("1");
		wdbvo.setWdbtitle("1");
		wdbvo.setFileName("1");
		wdboardService.insertWdboard(wdbvo);
//		System.out.println(wdbvo);
		model.addAttribute("data", wdbvo);
		return "boarddetail.jsp";
	}
	
	@RequestMapping("/login.do")
    public String selectOneMember(WdmemberVO wdmvo, HttpSession session,Model model) {
		wdmvo=wdmemberService.selectOneWdmember(wdmvo);
		if(wdmvo==null) {
			return "redirect:login.jsp";
		}
		else {
			session.setAttribute("udata", wdmvo);
			return "redirect:main.do";
		}
    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:main.do";
    }
}
