package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;

public class BranchDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BranchService branchService= new BranchServiceImp();

    public BranchDelete() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int br_num = Integer.parseInt(request.getParameter("br_num"));
		String msg = "지점 삭제 실패!";
		String redirectUrl = "/branch/list?br_num=" + br_num;
		if(branchService.deleteBranch(br_num)) {
			msg = "지점 삭제 성공!";
			redirectUrl = "/branch/list";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", redirectUrl);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
