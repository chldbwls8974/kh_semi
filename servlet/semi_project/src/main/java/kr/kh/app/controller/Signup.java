package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.vo.MemberVO;


public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
       
   
    public Signup() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/signup.jsp").forward(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("me_id");
		String pw = request.getParameter("me_pw");
		String pw2 = request.getParameter("me_pw2");
		String name = request.getParameter("me_name");
		String address = request.getParameter("me_address"); 
		String phone = request.getParameter("me_phone");
		boolean Ok = false;
			MemberVO member = new MemberVO(id,pw,pw2,name,address,phone,0,0,null);
			if(memberService.signup(member)) {
				Ok = true;
			}
		request.setAttribute("Ok", Ok);
		doGet(request, response);
	}

}
