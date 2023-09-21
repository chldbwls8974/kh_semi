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
		System.out.println(user);
		boolean Ok = false;
		if(user != null) {
			Ok = true;
			//유저 총 포인트 가져와서 db에 업데이트
			memberService.updateUserPoint(id, pointService.getUserPoint(id));
			//업데이트 한 user 다시 가져오기
			user = memberService.getMember(id);
		}
		
		request.setAttribute("Ok", Ok);
		request.getSession().setAttribute("user",user);
		doGet(request, response);
		
	}

}
