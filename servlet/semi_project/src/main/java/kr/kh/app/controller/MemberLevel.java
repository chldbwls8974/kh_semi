package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.LevelService;
import kr.kh.app.service.LevelServiceImp;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.vo.LevelVO;

public class MemberLevel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    LevelService levelService = new LevelServiceImp();   
    MemberService memberService = new MemberServiceImp();
    
    
    public MemberLevel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LevelVO criteria = levelService.getBenefitLevel("기준액");
		request.setAttribute("criteria", criteria);
		
		request.getRequestDispatcher("/WEB-INF/views/member/level.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer cri = Integer.parseInt(request.getParameter("level_cri"));
		String grade = request.getParameter("grade");
		LevelVO level = new LevelVO(grade,cri);

		boolean Ok = false;
		if(levelService.updateLevel(level)) {
			memberService.updateLevel(level);
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		
		doGet(request, response);
	}

}
