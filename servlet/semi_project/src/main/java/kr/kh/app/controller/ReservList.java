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
import kr.kh.app.service.ReservListService;
import kr.kh.app.service.ReservListServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.ReservListVO;
import kr.kh.app.vo.ReservationVO;

public class ReservList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservListService reservListService = new ReservListServiceImp();
	private DogService dogService = new DogServiceImp();

    public ReservList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		ReservationVO reserv = (ReservationVO)session.getAttribute("re_num");
		
		//getParameter로 받아와서 rl_re_num에 저장
		String rl_re_num = request.getParameter("rl_re_num");
		
		ArrayList<ReservListVO> rl = reservListService.getReservListArray(rl_re_num);
		request.setAttribute("rl", rl);
		
		/*String rl_d_num = request.getParameter("rl_d_num");*/
		ReservListVO rl2 = (ReservListVO)session.getAttribute("rl_d_num"); 

		ArrayList<DogVO> list = dogService.getDogList(rl2);
		request.setAttribute("list", list);

		request.getRequestDispatcher("/WEB-INF/views/reservation/detail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
