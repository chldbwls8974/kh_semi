package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.PriceService;
import kr.kh.app.service.PriceServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.ReservationVO;

public class ReservInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ReservService reservService = new ReservServiceImp();
	PriceService priceService = new PriceServiceImp();
	DogService dogService = new DogServiceImp();
    public ReservInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.getRequestDispatcher("/WEB-INF/views/reservation/main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 받아오는 데이터
		String re_me_id = request.getParameter("re_me_id");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String br_num = request.getParameter("branchSelect");
		// 3마리까지 받아옴 (d_num 으로)
		String d_num1 = request.getParameter("dogSelect");
		//null
		String d_num2 = request.getParameter("dogSelect2");
		String d_num3 = request.getParameter("dogSelect3");
		String[] dataArray = request.getParameterValues("dogSelect");
		 List<String> dataList = new ArrayList<>(Arrays.asList(dataArray));
		 for (String data : dataList) {
             System.out.println("Received data: " + data);
		 }
		
		//사용할 포인트
		int re_use_point = 0;
		
		ReservationVO reserv = reservService.createVO(re_me_id, from, to, br_num, d_num1, d_num2, d_num3, re_use_point);
		
		System.out.println(reserv);
		
		boolean ok = false;
		if(reservService.insertReserv(reserv)) {
			ok = true;
			request.setAttribute("ok", ok);
		};
		
		doGet(request, response);
	}
	
	
}
