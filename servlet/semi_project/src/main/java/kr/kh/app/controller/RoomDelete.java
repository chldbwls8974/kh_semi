package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.dao.RoomDAO;
import kr.kh.app.service.RoomService;
import kr.kh.app.service.RoomServiceImp;

public class RoomDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomService roomService = new RoomServiceImp();

    public RoomDelete() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제시 비번 확인
		if(request.getParameter("ro_num") == null) {
            response.sendRedirect(request.getContextPath()+"/room/main.jsp");
        }else {
		request.getRequestDispatcher("/WEB-INF/views/room/delete.jsp").forward(request, response);
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제할 글 번호 받아옴
		int ro_num = Integer.parseInt(request.getParameter("ro_num"));
//		String fileName = roomDao.getFileName(ro_num); //삭제할 글에 있는 파일정보 가져옴 =>파일첨부 구현 후 진행
		
		String msg = "게시글 삭제에 실패하였습니다.";
		String redirectUrl = "/room/detail?ro_num=" + ro_num;
		if(roomService.deleteRoom(ro_num)) {
			msg = "게시글을 삭제하였습니다.";
			redirectUrl = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", redirectUrl);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
	
}
