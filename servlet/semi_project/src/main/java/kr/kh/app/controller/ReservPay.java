package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.ReservationVO;

public class ReservPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReservService reservService = new ReservServiceImp();  
	
    public ReservPay() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String re_num = request.getParameter("re_num");
		Integer re_use_point = Integer.parseInt(request.getParameter("re_use_point"));
		Integer re_add_point = Integer.parseInt(request.getParameter("re_add_point"));
		Integer re_real_price= Integer.parseInt(request.getParameter("re_real_price"));
		
		ReservationVO reserv = new ReservationVO(re_num, 0, 0, 0, 0,re_real_price,
				re_use_point, re_add_point, null, null, null);
		
		boolean ok = false;
		
		if(reservService.updateReserv(reserv)) {
			ok = true;
		}
		request.setAttribute("reserv", reserv);
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
