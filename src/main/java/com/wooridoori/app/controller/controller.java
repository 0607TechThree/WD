package com.wooridoori.app.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.codec.binary.Base64;
import com.wooridoori.app.board.WdboardVO;

@Controller
public class controller {

	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String selectOneMember() {	
			return "music.jsp";
	}
	
	@RequestMapping(value="/imageUpload.do",method=RequestMethod.POST)
	@ResponseBody
	public String boardinsert(WdboardVO wdbvo,HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("로그: 오냐?");
		String base64 = request.getParameter("fileData1");
		String imageDataBytes = base64.split(",")[1];
		System.out.println(imageDataBytes);
		
		byte[] imageBytes = Base64.decodeBase64(imageDataBytes);
		BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imageBytes));

		System.out.println(bufImg);
		ImageIO.write(bufImg, "jpg", new File("D:\\0607KIM\\workspace\\WD\\src\\main\\webapp\\img\\ck\\1.jpg"));

		//System.out.println(wdbvo);
//		MultipartFile fileData=wdbvo.getFileData();
//	      if(!fileData.isEmpty()) {
//	    	 String fileName = fileData.getName();
//	    	 wdbvo.setFileName(fileName);
//	    	 System.out.println(fileName);
//	    	 //fileData.transferTo(new File("D:\\0607KIM\\workspace\\123123\\src\\main\\webapp\\images\\"+originalName)); 
//	      }
	      //System.out.println("로그1 :"+bvo);
		return "ckeditor.jsp";
	}
}
