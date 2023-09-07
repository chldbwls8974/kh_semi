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

/**
 * Servlet implementation class MyPage
 */
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogService dogService = new DogServiceImp();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		
		ArrayList<DogVO> list = dogService.getMyDogList(user);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
