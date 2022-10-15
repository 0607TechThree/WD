package com.wooridoori.app.idcheck;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wooridoori.app.model.member.WdmemberDAO;
import com.wooridoori.app.model.member.WdmemberService;
import com.wooridoori.app.model.member.WdmemberVO;

/**
 * Servlet implementation class Check
 */
@WebServlet("/checkId.check")
public class CheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WdmemberService wdmemberService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그1 ["+request.getParameter("userid")+"]");
		WdmemberDAO dao = new WdmemberDAO();
		WdmemberVO vo = new WdmemberVO();
		vo.setWdmid(request.getParameter("userid"));
		vo = wdmemberService.checkId(vo);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(vo+"");
	}

}
