package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;


public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Home() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
	}

	
	public void destroy() {
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �������� ȭ�鿡�� �����͸� ����
		request.setAttribute("msg","Hello");
		// �̸� �������� home.jsp�� ����
		request.getRequestDispatcher("WEB-INF/views/home.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ȭ�鿡�� ���� id�� ������
		String id = request.getParameter("id");
		System.out.println(id);
		doGet(request, response);
	}

}
