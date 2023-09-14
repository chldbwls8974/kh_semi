package kr.kh.app.controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.PriceService;
import kr.kh.app.service.PriceServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.PriceVO;

public class ReservInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ReservService reservService = new ReservServiceImp();
	PriceService priceService = new PriceServiceImp();
	
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
		// 3마리까지 받아옴
		String d_si_name1 = request.getParameter("dogSelect");
//		String d_si_name2 = request.getParameter("dogSelect2");
//		String d_si_name3 = request.getParameter("dogSelect3");
		String d_si_name2 = "m";
		String d_si_name3 = "l";
		
		//사이즈별 마리 수 구해오기
		int re_s_count = reservService.smallCount(d_si_name1,d_si_name2,d_si_name3);
		int re_m_count = reservService.mediumCount(d_si_name1,d_si_name2,d_si_name3);
		int re_l_count = reservService.largeCount(d_si_name1,d_si_name2,d_si_name3);
		
		//사이즈별 시세 가져오기
		PriceVO sPrice = priceService.getSizePrice("s");
		PriceVO mPrice = priceService.getSizePrice("m");
		PriceVO lPrice = priceService.getSizePrice("l");
		//총 가격
		int totalPrice = (re_s_count * sPrice.getPr_price()) + (re_m_count * mPrice.getPr_price()) + (re_l_count * lPrice.getPr_price());
		//이용일수 계산해서 가져오는 메서드
		int re_stay = reservService.calStayDay(from, to);
		
		
		////////////
		System.out.println(re_stay);
		System.out.println(totalPrice);
		System.out.println(re_s_count);
		System.out.println(re_m_count);
		System.out.println(re_l_count);
		System.out.println(sPrice);
		System.out.println(mPrice);
		System.out.println(lPrice);
		System.out.println(re_me_id);
		System.out.println(br_num);
		System.out.println(d_si_name1);
		
		
		
		
		boolean ok = true;
		request.setAttribute("ok", ok);
		doGet(request, response);
	}
	
	
}
