package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.BranchVO;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.RoomVO;

public class ReservMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogService dogService = new DogServiceImp();
	private RoomService roomService = new RoomServiceImp();
	private BranchService branchService = new BranchServiceImp();
       
    public ReservMain() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		
		
		ArrayList<BranchVO> branchList = branchService.getBranchList();
		ArrayList<DogVO> dogList = dogService.getMyDogList(user);
		ArrayList<RoomVO> roomList = roomService.getRoomList();
		request.setAttribute("dogList", dogList);
		request.setAttribute("roomList", roomList);
		request.setAttribute("branchList", branchList);
		
		request.getRequestDispatcher("/WEB-INF/views/reservation/main.jsp").forward(request, response);	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
