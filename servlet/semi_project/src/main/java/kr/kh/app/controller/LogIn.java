package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PointService;
import kr.kh.app.service.PointServiceImp;
import kr.kh.app.vo.MemberVO;


public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
    private PointService pointService = new PointServiceImp();
    
    public LogIn() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("me_id");
		String pw = request.getParameter("me_pw");
		MemberVO member = new MemberVO(id,pw,null,null,null,null,0,0, null);
		MemberVO user = memberService.login(member);
		boolean Ok = false;
		if(user != null) {
			Ok = true;
		}
		//내 포인트 총량 들고오기
		int myPoint = pointService.getUserPoint(id);
		//member 테이블에 업데이트
		memberService.updateUserPoint(id, myPoint);
		
		request.setAttribute("Ok", Ok);
		request.getSession().setAttribute("user",user);
		doGet(request, response);
		
	}

}
