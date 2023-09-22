package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.LevelService;
import kr.kh.app.service.LevelServiceImp;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PointService;
import kr.kh.app.service.PointServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.LevelVO;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.PointVO;
import kr.kh.app.vo.ReservationVO;

public class ReservPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReservService reservService = new ReservServiceImp();  
    private PointService pointService = new PointServiceImp();
	private MemberService memberService = new MemberServiceImp();
	private LevelService levelService = new LevelServiceImp();
	
    public ReservPay() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/reservation/pay.jsp").forward(request, response);
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
		PointVO addpoint = new PointVO(0, re_add_point, content, me_id, re_num);
		PointVO usepoint = new PointVO(0, re_use_point, content2, me_id, re_num);
		boolean ok = false;
		
		//포인트 사용할 때 내 포인트 이상 선택할 수 없게 해야함 (자바스크립트)
		if(reservService.updateReserv(reserv)) {
			//사용 포인트 0이면 -> 포인트사용내역DB에 등록 안해도 됨
			if(re_use_point != 0) {
				pointService.insertPoint(usepoint);
			}
			pointService.insertPoint(addpoint);
			ok = true;
		}
		
		
		//내 포인트 총량 들고오기
		int myPoint = pointService.getUserPoint(me_id);
		//member 테이블에 포인트 업데이트
		memberService.updateUserPoint(me_id, myPoint);
		//member테이블에 누적금액 업데이트
		LevelVO level = levelService.getBenefitLevel("기준액");
		memberService.updateTotalPrice(me_id,re_real_price,level);
		//업데이트 한 user 다시 가져오기
		MemberVO user = memberService.getMember(me_id);
		//세션에 업데이트 (로그인 해제하지 않아도 마이페이지에서 point를 업데이트 해 주기 위해서)
		request.getSession().setAttribute("user", user);
		
		
		request.setAttribute("reserv", reserv);
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
