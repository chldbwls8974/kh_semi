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
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.PointVO;
import kr.kh.app.vo.ReservationVO;

public class ReservPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReservService reservService = new ReservServiceImp();  
    private PointService pointService = new PointServiceImp();
	private MemberService memberService = new MemberServiceImp();
	
    public ReservPay() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/reservation/pay.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String re_num = request.getParameter("re_num");
		String content="호텔 결제에 의한 적립";
		String content2="호텔 결제시 포인트 사용에 의한 차감";
		String me_id = request.getParameter("me_id");
		Integer re_use_point = -(Integer.parseInt(request.getParameter("re_use_point")));
		Integer re_add_point = Integer.parseInt(request.getParameter("re_add_point"));
		Integer re_real_price= Integer.parseInt(request.getParameter("re_real_price"));
		
		ReservationVO reserv = new ReservationVO(re_num, 0, 0, 0, 0,re_real_price,
				re_use_point, re_add_point, null, null, null);
		PointVO addpoint = new PointVO(0,re_add_point,content,me_id);
		PointVO usepoint = new PointVO(0,re_use_point,content2,me_id);
		boolean ok = false;
		
		
		if(reservService.updateReserv(reserv)) {
			pointService.insertPoint(usepoint);
			pointService.insertPoint(addpoint);
			ok = true;
		}
		//내 포인트 총량 들고오기
		int myPoint = pointService.getUserPoint(me_id);
		//member 테이블에 업데이트
		memberService.updateUserPoint(me_id, myPoint);
		
		
		request.setAttribute("reserv", reserv);
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
