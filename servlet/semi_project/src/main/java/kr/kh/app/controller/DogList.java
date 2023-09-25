package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public class DogList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DogService dogService = new DogServiceImp(); 
	
    public DogList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		
		//세션 이용자의 권한이 ADMIN일 때 사용
		ArrayList<DogVO> allList = dogService.getDogList();
		//세션 이용자의 권한이 USER일 때 사용
		ArrayList<DogVO> list = dogService.getMyDogList(user);
		
		request.setAttribute("allList", allList);
		request.setAttribute("list", list);
//		int dogCount = list.size() + 1;
		
		request.getRequestDispatcher("/WEB-INF/views/dog/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
