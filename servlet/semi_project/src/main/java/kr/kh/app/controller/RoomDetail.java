package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.BranchVO;
import kr.kh.app.vo.RoomVO;


public class RoomDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomService roomService = new RoomServiceImp();
	BranchService branchService = new BranchServiceImp();
   
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
		int br_num = room.getRo_br_num();
		
		BranchVO branch = branchService.getBranch(br_num);
		
		request.setAttribute("room", room);
		request.setAttribute("branch", branch);
		request.getRequestDispatcher("/WEB-INF/views/room/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
