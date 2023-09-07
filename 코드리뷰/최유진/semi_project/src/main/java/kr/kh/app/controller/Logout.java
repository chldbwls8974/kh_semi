package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.vo.MemberVO;

public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user =(MemberVO)request.getSession().getAttribute("user");
		boolean Ok = false;
		if(user != null) {
			Ok = true;
			request.getSession().removeAttribute("user");
			request.getSession().invalidate();
		}
		request.setAttribute("Ok", Ok);
		request.getRequestDispatcher("/WEB-INF/views/member/logout.jsp").forward(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("Ok", true);
		request.getSession().setAttribute("user",null);
		doGet(request, response);
	}

}
