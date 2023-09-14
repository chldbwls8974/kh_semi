package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;


public class DogDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DogService dogService= new DogServiceImp();


    public DogDelete() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String d_num = request.getParameter("d_num");
		String msg = "삭제 실패!";
		String redirectUrl = "/dog/list?d_num=" + d_num;
		if(dogService.deleteDog(d_num)) {
			msg = "삭제 성공!";
			redirectUrl = "/dog/list";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", redirectUrl);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
