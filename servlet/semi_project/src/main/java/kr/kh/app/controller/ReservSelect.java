package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.json.JSONArray;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.RoomVO;

public class ReservSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BranchService branchService = new BranchServiceImp();
    private RoomService roomService = new RoomServiceImp();
	private DogService dogService = new DogServiceImp();
    public ReservSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax를 통해 넘겨받은 지점 번호, 개 번호
		Integer br_num = Integer.parseInt(request.getParameter("br_num"));
		String d_num = request.getParameter("d_num");
		//개 번호로 사이즈 가져오기
		DogVO dog = dogService.getDog(d_num);
		String d_size = dog.getD_si_name();
		
		ArrayList<RoomVO> roomlist = roomService.getRoomListByBranchAndSize(br_num, d_size);
		
		JSONArray jsonArray = new JSONArray(roomlist);
		request.setAttribute("roomlist", jsonArray.toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
