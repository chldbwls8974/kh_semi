package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.RoomVO;

public class RoomUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomService roomService = new RoomServiceImp();

    public RoomUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		//roomService에게 방 번호 가져오라고 요청
		RoomVO room = roomService.getRoom(ro_num);
		//jsp페이지로 넘겨준다
		request.setAttribute("room", room);
		request.getRequestDispatcher("/WEB-INF/views/room/update.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		
		String ro_name = request.getParameter("ro_name");
		int ro_max_cap = Integer.parseInt(request.getParameter("ro_max_cap"));
		int ro_now_cap = Integer.parseInt(request.getParameter("ro_now_cap"));
		int ro_br_num = Integer.parseInt(request.getParameter("ro_br_num"));
		String ro_detail = request.getParameter("ro_detail");
		
		RoomVO room = new RoomVO(ro_num, ro_name, ro_max_cap, ro_now_cap, ro_br_num,ro_detail);
		System.out.println(room);
		
		boolean ok = false;
		if(roomService.updateRoom(room)) {
			ok = true;
		}
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
