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
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public class DogInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DogService dogService = new DogServiceImp(); 
    
    private int count ;
    
    public DogInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//추가코드 4줄
//		HttpSession session = request.getSession();
//		MemberVO user = (MemberVO)session.getAttribute("user"); 
//		ArrayList<DogVO> list = dogService.getMyDogList(user);
//		count = list.size();
		
		request.getRequestDispatcher("/WEB-INF/views/dog/insert.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String name = request.getParameter("d_name");
		String age = request.getParameter("d_age");
		String gen = request.getParameter("d_gen");
		Integer kg =  Integer.parseInt(request.getParameter("d_kg"));
		String detail = request.getParameter("d_detail");
		
		// 유저 세션정보 받아오기
		MemberVO user = (MemberVO)session.getAttribute("user");  
		String id = user.getMe_id();
		
		// 강아지는 소 : 8kg 이하 / 중 : 9kg 이상 20kg미만 / 대 : 20kg 이상으로 구분된다.
		String siName = request.getParameter("d_si_name"); 
		if (kg <= 8) { siName = "s"; }
		else if(kg <= 20) {	siName ="m"; }
		else { siName ="l"; }
		
		// 반려동물번호 생성 // user + (s/m/l) + 1 <<<<<숫자 어케함?
		count++;
		String num = id  + siName + 1; 
		
		DogVO dog = new DogVO(num, name, age, gen, kg, detail, id, siName);
		System.out.println(dog);
		
		boolean ok = false;
		
		if(dogService.insertDog(dog)) {
			ok = true;
		}
		request.setAttribute("Ok", ok);
		doGet(request, response); 
		
	}
}


