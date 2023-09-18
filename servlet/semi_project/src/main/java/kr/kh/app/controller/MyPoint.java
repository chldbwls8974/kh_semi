package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.PointService;
import kr.kh.app.service.PointServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.PointVO;

public class MyPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PointService pointService = new PointServiceImp();
	ReservService reservService = new ReservServiceImp();

    public MyPoint() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<PointVO> list = pointService.getMyPointList(user);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypoint.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
