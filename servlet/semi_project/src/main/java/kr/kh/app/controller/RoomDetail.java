package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.RoomVO;


public class RoomDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomService roomService = new RoomServiceImp();
   
    public RoomDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer ro_num = null;
		try {
		ro_num = Integer.parseInt(request.getParameter("ro_num"));
		}catch(Exception e) {
			ro_num = null;
		}	
		RoomVO room = roomService.getRoom(ro_num);
		request.setAttribute("room", room);
		request.getRequestDispatcher("/WEB-INF/views/room/plus/roomdetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}