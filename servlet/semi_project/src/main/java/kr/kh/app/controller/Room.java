package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.service.SizeService;
import kr.kh.app.service.SizeServiceImp;
import kr.kh.app.vo.BranchVO;
import kr.kh.app.vo.RoomVO;

public class Room extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomService roomService = new RoomServiceImp();
	private BranchService branchService = new BranchServiceImp();

    public Room() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
		ArrayList<RoomVO> list = roomService.getRoomList();
		
		ArrayList<RoomVO> todaylist = roomService.getRoomListByDate();
		ArrayList<BranchVO> branchList = branchService.getBranchList();
		
		request.setAttribute("branchList", branchList);
		request.setAttribute("list", list);
		request.setAttribute("todaylist", todaylist);
		
		request.getRequestDispatcher("/WEB-INF/views/room/main.jsp").forward(request, response);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
