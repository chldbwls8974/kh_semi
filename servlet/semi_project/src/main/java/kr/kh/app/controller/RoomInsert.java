package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.dao.RoomDAO;
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
		request.getRequestDispatcher("/WEB-INF/views/room/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String detail = request.getParameter("detail");
		Integer max_cap = Integer.parseInt(request.getParameter("max_cap"));
		Integer branch = Integer.parseInt(request.getParameter("branch"));
		RoomVO room = new RoomVO(name,max_cap,0,branch,detail);
		boolean ok = false;
		if(roomService.insertRoom(room)) {
			ok = true;
		}
		request.setAttribute("ok", ok);
		doGet(request, response);
		
		
	}

}
