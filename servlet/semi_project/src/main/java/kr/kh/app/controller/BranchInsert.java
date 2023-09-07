package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.vo.BranchVO;


public class BranchInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchService branchService = new BranchServiceImp();
       
    public BranchInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/branch/insert.jsp").forward(request, response);	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("br_name");
		String phone = request.getParameter("br_phone");
		BranchVO branch = new BranchVO(name, phone);
		boolean ok = false;
		if(branchService.insertBranch(branch)) {
			ok = true;
		}
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
