package kr.kh.app.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.ReservDateService;
import kr.kh.app.service.ReservDateServiceImp;
import kr.kh.app.service.ReservService;
import kr.kh.app.service.ReservServiceImp;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.RoomVO;

public class ReservSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RoomService roomService = new RoomServiceImp();
	private DogService dogService = new DogServiceImp();
	private ReservDateService reservDateService = new ReservDateServiceImp();
	private ReservService reservService = new ReservServiceImp();
	
    public ReservSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax를 통해 넘겨받은 지점 번호, 개 번호, 날짜
		Integer br_num = Integer.parseInt(request.getParameter("br_num"));
		String d_num = request.getParameter("d_num");
		// 날짜
		String from = request.getParameter("start_date");
		String to = request.getParameter("end_date");
		//List<LocalDate> date = reservService.calStayDay(from,to);
		
		
		//개 번호로 사이즈 가져오기
		DogVO dog = dogService.getDog(d_num);
		String d_size = dog.getD_si_name();
		List<RoomVO> list = new ArrayList<>();
		/*
		 * for(int i = 0 ;i < date.size();i++) { List<RoomVO> t =
		 * roomService.getlist(date.get(i),br_num, d_size); list.addAll(t);
		 * 
		 * }
		 */
		
		
		ArrayList<RoomVO> roomlist = roomService.getRoomListByBranchAndSize(br_num, d_size);
		// -> 지점,개사이즈 맞는 방임 ex) 방 3개 들고왔음       // 3개를 들고왔어 20일에는 3개가 다돼 21일에는 2개만돼 22일에는 3개가 돼
		//     -> 해당 날짜에 수용량이 여유있어야함 (예약마리수 < 최대마리수) ==> 1마리 일때는 되는 코드임 / 소형견 2마리, 대형견 1마리면 ==> 어떻게? -> 사이즈별 마리수 판별하고 -> 메서드 매개변수(방, 날짜, 마리수) 넘겨줌
		//			-> 선택한 모든 날짜에 여유가있어야함.
		//메서드는 -> 방,날짜를 매개변수로 그날 예약된 마리수를 리턴함
		// roomService.머시기메서드(roomlist.get(0), 날짜) -> 핑크방에 20일에 몇마리가 묵는지 알려줌 < max_cap 이면 그날에 묵을수있음
		// roomService.머시기메서드(roomlist.get(1), 날짜) -> 블루방에 20일에 몇마리가 묵는지 알려줌
		// roomService.머시기메서드(roomlist.get(2), 날짜) -> 오렌지방에 20일에 몇마리가 묵는지 알려줌
		// 방, 해당날짜 -> 그 방이 해당날짜에 예약이 되는지 -> 알려면 ???
		
		
		JSONArray jsonArray = new JSONArray(roomlist);
		request.setAttribute("roomlist", jsonArray.toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
//	날짜를 받아와서 그 날 그 방이 몇마리 예약되어있는지 확인하는 쿼리
//	SELECT count(*) as 몇마리
//	FROM reservdate
//	where rd_ro_num = 1
//	and rd_date = "2023-09-22"
//	group by rd_ro_num
//	;
}
