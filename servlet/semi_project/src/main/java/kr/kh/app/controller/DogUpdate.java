package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.vo.DogVO;

public class DogUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogService dogService = new DogServiceImp();
   
	public DogUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String d_num = request.getParameter("d_num");
		//dog에게 번호 가져오라고 요청
		DogVO dog= dogService.getDog(d_num);
		request.setAttribute("dog", dog);
		request.getRequestDispatcher("/WEB-INF/views/dog/update.jsp").forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String d_num = request.getParameter("d_num");
		String d_name = request.getParameter("d_name");
		String d_age = request.getParameter("d_age");
		String d_gen = request.getParameter("d_gen");
		int d_kg = Integer.parseInt(request.getParameter("d_kg"));
		String d_detail = request.getParameter("d_detail");
		
		DogVO dog = new DogVO(d_name, d_age, d_gen, d_kg, d_detail);
		String url = "/dog/list?d_num=" + d_num;
		String msg = "수정 완료";
		
		if(dogService.updateDog(dog)) {
			url = "/dog/list?d_num=" + d_num;
			msg = "수정 실패";
		}
		
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
