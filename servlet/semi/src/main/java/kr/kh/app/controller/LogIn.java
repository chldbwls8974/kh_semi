package kr.kh.app.controller;

import java.io.IOException;
<<<<<<< HEAD
=======
import java.lang.ProcessBuilder.Redirect;
>>>>>>> chldbwls

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.vo.MemberVO;


public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
       
    public LogIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
		request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request,response);
=======
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request,response);
>>>>>>> chldbwls
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("me_id");
		String pw = request.getParameter("me_pw");
		MemberVO member = new MemberVO(id,pw,null,null,null);
<<<<<<< HEAD
		boolean Ok = false;
		if(memberService.login(member)) {
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		doGet(request, response);
=======
		MemberVO user = memberService.login(member);
		boolean Ok = false;
		if(user!=null) {
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		request.getSession().setAttribute("user",user);
		doGet(request, response);
		
>>>>>>> chldbwls
	}

}
