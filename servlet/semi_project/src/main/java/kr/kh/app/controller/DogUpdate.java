package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.SizeService;
import kr.kh.app.service.SizeServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public class DogUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogService dogService = new DogServiceImp();
	private SizeService sizeService = new SizeServiceImp();
	
	public DogUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String d_num = request.getParameter("d_num");
		// dog에게 동물번호 가져오라고 요청
		DogVO dog = dogService.getDog(d_num);
		request.setAttribute("dog", dog);
		request.getRequestDispatcher("/WEB-INF/views/dog/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인한 user 아이디 불러옴
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		DogVO dog = new DogVO();
		String newNum = request.getParameter("d_num");
		String newName = request.getParameter("d_name");
		String newAge = request.getParameter("d_age");
		String newGen = request.getParameter("d_gen");
		int newKg = Integer.parseInt(request.getParameter("d_kg"));
		String newDetail = request.getParameter("d_detail");
		String siName = request.getParameter("d_si_name"); 
		if (sizeService.getSize("L").getSi_min_kg() <= newKg) { siName = "L"; }
		else if(sizeService.getSize("M").getSi_min_kg() <= newKg) {	siName ="M"; }
		else { siName ="S"; }
		
		dog.setD_num(newNum);
		dog.setD_name(newName);
		dog.setD_age(newAge);
		dog.setD_gen(newGen);
		dog.setD_kg(newKg);
		dog.setD_detail(newDetail);
		dog.setD_si_name(siName);
		dog.setD_me_id(member.getMe_id());

		boolean Ok = false;
		if(dogService.updateDog(dog)) {
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		
		doGet(request, response);

		/*
		 * String url="/dog/list?d_num=" + newNum; String msg = "수정 완료";
		 * if(dogService.updateDog(dog)) { url = "/dog/update?d_num=" + newNum(); msg =
		 * "수정 실패"; }
		 * 
		 * request.setAttribute("url", url); request.setAttribute("msg", msg);
		 * request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request,
		 * response);
		 */
		
	}
}
