package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.PointService;
import kr.kh.app.service.PointServiceImp;
import kr.kh.app.vo.PointVO;

public class PointUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PointService pointService = new PointServiceImp();
       
    public PointUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer p_num = Integer.parseInt(request.getParameter("num"));
		Integer p_point = Integer.parseInt(request.getParameter("point"));
		String p_content = request.getParameter("content");
		PointVO point = new PointVO(p_num,p_point,p_content,null);
		pointService.updatePoint(point);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
