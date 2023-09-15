package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
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
		
		RoomVO room = new RoomVO(ro_name, ro_max_cap, ro_now_cap, ro_br_num,ro_detail);
		String url = "/room/update?ro_num=" + ro_num;
		String msg = "객실 수정 완료";
		
		if(roomService.updateRoom(room)) {
			url = "/room/detail?ro_num=" + ro_num;
			msg = "객실 수정 실패";
		}
		System.out.println(room);
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
