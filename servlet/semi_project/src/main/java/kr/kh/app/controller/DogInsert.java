package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.kh.app.service.DogService;
import kr.kh.app.service.DogServiceImp;
import kr.kh.app.service.SizeService;
import kr.kh.app.service.SizeServiceImp;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public class DogInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DogService dogService = new DogServiceImp(); 
	private SizeService sizeService = new SizeServiceImp();
    
    public DogInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/dog/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//세션에서 user 받아오기 / list에 해당 user 반려견 목록 불러오기
		MemberVO user = (MemberVO)session.getAttribute("user"); 
		ArrayList<DogVO> list = dogService.getMyDogList(user);
		int myDogCount = list.size();
		
		
		String name = request.getParameter("d_name");
		String age = request.getParameter("d_age");
		String gen = request.getParameter("d_gen");
		Integer kg =  Integer.parseInt(request.getParameter("d_kg"));
		String detail = request.getParameter("d_detail");
		
		String id = user.getMe_id();
		
		// 강아지의 무게가 L사이즈의 최소무게 이상이면 = L
		String siName; 
		if (sizeService.getSize("L").getSi_min_kg() <= kg) { siName = "L"; }
		else if(sizeService.getSize("M").getSi_min_kg() <= kg) {	siName ="M"; }
		else { siName ="S"; }
		
		// 관리자 - 수정, 삭제
		
		// 반려동물번호 생성 // user + 00 + 1(증가) //최대 3마리
		String num = id  + "00" + (list.size() +1);
		
		DogVO dog = new DogVO(num, name, age, gen, kg, detail, id, siName);
		
		boolean ok = false;
		//개가 3마리 이상이면 실패
		if(myDogCount >= 3) {
			request.setAttribute("ok", ok);
		}
		else{
			if(dogService.insertDog(dog)) {
				ok = true;
			}
			request.setAttribute("ok", ok);
		}
		
		doGet(request, response); 
		
	}
}


