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

public class PointDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PointService pointService = new PointServiceImp();
	private MemberService memberService = new MemberServiceImp();

    public PointDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/mypoint.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer p_num = Integer.parseInt(request.getParameter("num"));
	    Integer p_point = Integer.parseInt(request.getParameter("point"));
	    String p_content = request.getParameter("content");
	    String p_id = request.getParameter("id");
	    
		PointVO point = new PointVO(p_num,p_point,p_content, p_id);
		
		//포인트 삭제를 서비스에게 요청
        boolean success = pointService.deletePoint(point);
        
        //member 테이블에 업데이트
  		memberService.updateUserPoint(p_id, pointService.getUserPoint(p_id));
        
        if (success) {
            response.getWriter().println("포인트가 차감되었습니다.");
        } else {
            response.getWriter().println("사용자가 없거나 포인트가 부족합니다.");
        }
        
	}

}
