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
		List<LocalDate> date = reservService.calStayDay(from,to);
		
		
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
		
		
		ArrayList<RoomVO> roomlist = roomService.getRoomListByBranchAndSize(from, to,br_num, d_size);
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

}
