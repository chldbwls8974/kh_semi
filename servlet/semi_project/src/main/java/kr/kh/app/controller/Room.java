package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.RoomVO;

public class Room extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomService roomService = new RoomServiceImp();

    public Room() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		ArrayList<RoomVO> list = roomService.getRoomList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/room/roommain.jsp").forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
