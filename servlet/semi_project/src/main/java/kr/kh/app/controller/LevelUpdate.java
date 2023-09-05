package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.LevelService;
import kr.kh.app.service.LevelServiceImp;
import kr.kh.app.vo.LevelVO;

public class LevelUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    LevelService levelService = new LevelServiceImp();
	
    public LevelUpdate() {
        super();
    }
    // 혜택 (%)를 수정할 수 있게, 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/level/update.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// general, vip 두 개의 수정값을 한번에 받아와서 -> 객체로 만듬
		Integer benefit = Integer.parseInt(request.getParameter("le_benefit"));
		Integer benefitVip = Integer.parseInt(request.getParameter("le_benefit_vip"));
		
		LevelVO level = new LevelVO("general", benefit);
		LevelVO levelVip = new LevelVO("vip", benefitVip);
		// 메서드 1개로 2번 실행되게 (vip,general)
		boolean Ok = false;
		if(levelService.updateLevel(level) && levelService.updateLevel(levelVip)) {
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		
		
		doGet(request, response);
	}

}
