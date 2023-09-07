package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.RoomVO;

public class RoomInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private RoomService roomService = new RoomServiceImp();

	
    public RoomInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/room/plus/roominsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String detail = request.getParameter("detail");
		String name = request.getParameter("name");
		RoomVO room = new RoomVO(0,name, detail, 0, 0, 0);
		boolean ok = false;
		if(roomService.insertRoom(room)) {
			ok = true;
		}
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}