package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.vo.MemberVO;

public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberServiceImp();  
	
    public MemberList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberVO> list = memberService.selectMemberList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/member/list.jsp").forward(request, response);	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
