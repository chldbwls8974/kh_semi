package kr.kh.app.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.LevelService;
import kr.kh.app.service.LevelServiceImp;
import kr.kh.app.service.PriceService;
import kr.kh.app.service.PriceServiceImp;
import kr.kh.app.service.ReservDateService;
import kr.kh.app.service.ReservDateServiceImp;
import kr.kh.app.service.ReservListService;
import kr.kh.app.service.ReservListServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.vo.LevelVO;
import kr.kh.app.vo.ReservListVO;
import kr.kh.app.vo.ReservationVO;

public class ReservInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ReservService reservService = new ReservServiceImp();
	ReservListService reservListService = new ReservListServiceImp();
	PriceService priceService = new PriceServiceImp();
	DogService dogService = new DogServiceImp();
	LevelService levelService = new LevelServiceImp();
	ReservDateService reservDateService = new ReservDateServiceImp();
	
    public ReservInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String re_num = request.getParameter("re_num");
		ReservationVO reserv = reservService.getReserv(re_num);
		request.setAttribute("reserv_after", reserv);
		request.getRequestDispatcher("/WEB-INF/views/reservation/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면으로 보내주는 데이터
		//db에 저장된 등급별 적립률 가져오기
		LevelVO defaultLevel = levelService.getBenefitLevel("일반");
		LevelVO vipLevel =levelService.getBenefitLevel("vip");
		request.setAttribute("defaultLevel", defaultLevel);
		request.setAttribute("vipLevel", vipLevel);
		
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
         // 입력받은 개와 방 정보 받아오기
        String[] dogArray = request.getParameterValues("dogSelect");
        String[] roomArray = request.getParameterValues("roomSelect");
        
       
        // reservation serviceimp에서 두 날짜를 형변환하고 두 사이의 날짜를 추출
        List<LocalDate> date = reservService.calStayDay(from,to);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		  if (dogArray != null) {
	            // 변수 초기화
			  d_num1 = null;
			  d_num2 = null;
			  d_num3 = null;
	            
	            // 데이터 처리 및 변수에 저장
	            if (dogArray.length > 0) {
	            	d_num1 = dogArray[0]; // 첫 번째 값
	            }
	            if (dogArray.length > 1) {
	            	d_num2 = dogArray[1]; // 두 번째 값
	            }
	            if (dogArray.length > 2) {
	            	d_num3 = dogArray[2]; // 세 번째 값
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
		
		//사용할 포인트
		int re_use_point = 0;
		String re_num = re_me_id + from + d_num1;
		ReservationVO reserv = reservService.createVO(re_num, re_me_id, from, to, br_num, d_num1, d_num2, d_num3, re_use_point);
		ReservListVO reservlist1 = new ReservListVO(0,r_num1,d_num1, re_num);
		ReservListVO reservlist2 = new ReservListVO(0,r_num2,d_num2, re_num);
		ReservListVO reservlist3 = new ReservListVO(0,r_num3,d_num3, re_num);
		
		//지점,개,방 하나라도 선택하지 않으면 false
        boolean isCorrectSelect = reservService.isCorrectSelect(br_num, dogArray, roomArray);
		//입실 날짜가 오늘과 같거나 오늘보다 빠르면 실패
		boolean ok = false;
		//true=db에 등록 , false=등록하지않고 메세지 출력
		if(isCorrectSelect) {
			//예약테이블에 추가하는 코드
			request.setAttribute("reserv", reserv);
			if(reservService.insertReserv(reserv)) {
				ok = true;
				request.setAttribute("ok", ok);
			};
			//예약리스트에 추가하는 코드
			if(d_num1 != null && r_num1 != 0 ) {
				reservListService.insertReservList(reservlist1);
				for(int i=0;i<date.size();i++) {
            		reservDateService.insertReservDate(r_num1,br_num,date.get(i).format(formatter));
            	}
			}
			if(d_num2 != null  && r_num2 != 0) {
				reservListService.insertReservList(reservlist2);
				for(int i=0;i<date.size();i++) {
            		reservDateService.insertReservDate(r_num2,br_num,date.get(i).format(formatter));
            	}
			}
			if(d_num3 != null  && r_num3 != 0) {
				reservListService.insertReservList(reservlist3);
				for(int i=0;i<date.size();i++) {
            		reservDateService.insertReservDate(r_num3,br_num,date.get(i).format(formatter));
            	}
			}
		}
		else {
			request.setAttribute("url", "/reservation/main");
			request.setAttribute("msg", "예약 실패!");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			
		}
		
		if(isCorrectSelect) {
			doGet(request, response);
		}
		
		
	}
	
	
}
