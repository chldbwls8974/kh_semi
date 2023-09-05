package kr.kh.app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.BranchService;
import kr.kh.app.service.BranchServiceImp;
import kr.kh.app.vo.BranchVO;

import java.io.IOException;
import java.util.ArrayList;

public class Branch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchService branchService = new BranchServiceImp();
       
    public Branch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//지점리스트 불러오기
		ArrayList<BranchVO> list = branchService.getBranchList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/branch/list.jsp").forward(request, response);	
<<<<<<< HEAD:코드리뷰/최유진/semi_project/src/main/java/kr/kh/app/controller/Branch.java
=======
		response.getWriter().append("Served at: ").append(request.getContextPath());
>>>>>>> 4132233da10b8b8ba13ce6a046097bb301f69900:코드리뷰/임은영/branch.java
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("br_name");
		String phone = request.getParameter("br_phone");
<<<<<<< HEAD:코드리뷰/최유진/semi_project/src/main/java/kr/kh/app/controller/Branch.java
		BranchVO branch = new BranchVO(num, name, phone,0);
=======
		BranchVO branch = new BranchVO(name, phone);
>>>>>>> 4132233da10b8b8ba13ce6a046097bb301f69900:코드리뷰/임은영/branch.java
		boolean ok = false;
		if(branchService.insertBranch(branch)) {
			ok = true;
		}
		request.setAttribute("ok", ok);
		doGet(request, response);
	}

}
