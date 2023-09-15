package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;

public class RoomDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomService roomService = new RoomServiceImp();

    public RoomDelete() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		String msg = "삭제에 실패했습니다.";
		String redirectUrl = "/room/main?ro_num=" + ro_num;
		if(roomService.deleteRoom(ro_num)) {
			msg = "삭제에 성공했습니다.";
			redirectUrl = "/room/main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", redirectUrl);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
	
}
