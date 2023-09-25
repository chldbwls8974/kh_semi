package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservationVO;

public class MyReserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservService reservService = new ReservServiceImp();

    public MyReserv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		
		ArrayList<ReservationVO> list = reservService.getMyReservArray(user);
		ArrayList<ReservationVO> listAdmin = reservService.getReservArray();
		
		request.setAttribute("user", user);
		request.setAttribute("list", list);
		request.setAttribute("listAdmin", listAdmin);
		request.getRequestDispatcher("/WEB-INF/views/reservation/list.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
