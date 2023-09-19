package kr.kh.app.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.ReservListService;
import kr.kh.app.service.ReservListServiceImp;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservListVO;
import kr.kh.app.vo.ReservationVO;


public class ReservList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservListService reservListService = new ReservListServiceImp();

    public ReservList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		
		ReservationVO num = (ReservationVO)session.getAttribute("re_num"); 
		
		Integer rl_num; 
		try {
			rl_num = Integer.parseInt(request.getParameter("rl_num"));
		}catch(Exception e) {
			rl_num = null;
		}
		ReservListVO reservlist = reservListService.getReservList(rl_num);
		request.setAttribute("reservlist", reservlist);
		
		request.setAttribute("re_num", num);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
