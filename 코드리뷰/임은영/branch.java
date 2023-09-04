package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.vo.BranchVO;

public class Branch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchService branchService = new BranchServiceImp();

    public Branch() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BranchVO> list = branchService.getBranchList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/member/branch.jsp").forward(request, response);	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("br_num"));
		String name = request.getParameter("br_name");
		String phone = request.getParameter("br_phone");
		BranchVO branch = new BranchVO(num, name, phone);
		boolean ok = false;
		if(branchService.insertBranch(branch)) {
			ok = true;
		}
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
