package kr.kh.app.controller;

import java.io.IOException;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.PriceService;
import kr.kh.app.service.PriceServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.MemberVO;
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
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		request.getRequestDispatcher("/WEB-INF/views/reservation/insert.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 받아오는 데이터
		String re_me_id = request.getParameter("re_me_id");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String br_num = request.getParameter("branchSelect");
		String d_num1 = null;
		String d_num2 = null;
		String d_num3 = null;
		
		int r_num1 = 0;
        int r_num2 = 0;
        int r_num3 = 0;
        
		String[] dataArray = request.getParameterValues("dogSelect");
		String[] roomArray = request.getParameterValues("roomSelect");
		
		  if (dataArray != null) {
	            // 변수 초기화
			  d_num1 = null;
			  d_num2 = null;
			  d_num3 = null;
	            
	            // 데이터 처리 및 변수에 저장
	            if (dataArray.length > 0) {
	            	d_num1 = dataArray[0]; // 첫 번째 값
	            }
	            if (dataArray.length > 1) {
	            	d_num2 = dataArray[1]; // 두 번째 값
	            }
	            if (dataArray.length > 2) {
	            	d_num3 = dataArray[2]; // 세 번째 값
	            }

	        }
		  
		  if (roomArray != null) {
	            // 변수 초기화
				  r_num1 = 0;
		          r_num2 = 0;
		          r_num3 = 0;
	            
	            // 데이터 처리 및 변수에 저장
	            if (roomArray.length > 0) {
	            	
	            	r_num1 = Integer.parseInt(roomArray[0]); // 첫 번째 값
	            }
	            if (roomArray.length > 1) {
	            	r_num2 =  Integer.parseInt(roomArray[1]); // 두 번째 값
	            }
	            if (roomArray.length > 2) {
	            	r_num3 =  Integer.parseInt(roomArray[2]); // 세 번째 값
	            }

	        }
		  System.out.println(r_num1);
		  System.out.println(r_num2);
		  System.out.println(r_num3);
		
		//사용할 포인트
		int re_use_point = 0;
		String re_num = re_me_id + from + d_num1;
		ReservationVO reserv = reservService.createVO(re_num, re_me_id, from, to, br_num, d_num1, d_num2, d_num3, re_use_point);
		
		
		request.setAttribute("reserv", reserv);
		
		boolean ok = false;
		if(reservService.insertReserv(reserv)) {
			
			ok = true;
			request.setAttribute("ok", ok);
		};
		
		doGet(request, response);
	}
	
	
}
