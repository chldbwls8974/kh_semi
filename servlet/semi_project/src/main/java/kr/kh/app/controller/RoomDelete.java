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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/room/message.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		String msg = "게시글 삭제에 실패하였습니다.";
		String redirectUrl = "/room/plus/roomdetail?ro_num=" + ro_num;
		if(roomService.deleteRoom(ro_num)) {
			msg = "게시글을 삭제하였습니다.";
			redirectUrl = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", redirectUrl);
	}

}
