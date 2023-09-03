package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.vo.DogVO;

public class DogInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DogInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/dog/insertdog.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("d_num");
		String name = request.getParameter("d_name");
		String age = request.getParameter("d_age");
		String gen = request.getParameter("d_gen");
		Integer kg =  Integer.parseInt(request.getParameter("d_kg"));
		//detail 입력안하면 어떻게?(디폴트는 null임)
		String detail = request.getParameter("d_detail");
		String id = request.getParameter("d_me_id");
		String siName = request.getParameter("d_si_name");
		
		DogVO dog = new DogVO(num,name,age,gen,kg,detail,id,siName);
		
		boolean ok = false;
		/*
		if(boardService.insertBoard(board)) {
			ok = true;
		}
		*/
		
		request.setAttribute("ok", ok);
		doGet(request, response); 
	}
}


