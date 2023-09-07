package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.vo.MemberVO;


public class BranchInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BranchInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<<< HEAD:servlet/semi_project/src/main/java/kr/kh/app/controller/Logout.java
		MemberVO user =(MemberVO)request.getSession().getAttribute("user");
		boolean Ok = false;
		if(user != null) {
			Ok = true;
			request.getSession().removeAttribute("user");
			request.getSession().invalidate();
		}
		request.setAttribute("Ok", Ok);
		request.getRequestDispatcher("/WEB-INF/views/member/logout.jsp").forward(request,response);
========
		request.getRequestDispatcher("/WEB-INF/views/branch/insert.jsp").forward(request, response);	
>>>>>>>> main:servlet/semi_project/src/main/java/kr/kh/app/controller/BranchInsert.java
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<<< HEAD:servlet/semi_project/src/main/java/kr/kh/app/controller/Logout.java
		
		request.setAttribute("Ok", true);
		request.getSession().setAttribute("user",null);
========
>>>>>>>> main:servlet/semi_project/src/main/java/kr/kh/app/controller/BranchInsert.java
		doGet(request, response);
	}

}
