package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PointService;
import kr.kh.app.service.PointServiceImp;
import kr.kh.app.vo.PointVO;

public class PointInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PointService pointService = new PointServiceImp();
	private MemberService memberService = new MemberServiceImp();
	
    public PointInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/point/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int po_point = Integer.parseInt(request.getParameter("po_point"));
		String content = request.getParameter("po_content");
		String me_id = request.getParameter("po_me_id");
		PointVO point = new PointVO(0,po_point, content, me_id);
		boolean ok = false;
		if(pointService.insertPoint(point)) {
			ok = true;
		}
		 //member 테이블에 업데이트
  		memberService.updateUserPoint(me_id, pointService.getUserPoint(me_id));
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
