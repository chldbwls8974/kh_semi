package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.vo.MemberVO;


public class MyPageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();

    public MyPageUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HTTP 요청에서 "me_id"라는 이름의 매개변수(parameter) 값을 가져와서 me_id라는 문자열 변수에 저장
		String me_id= request.getParameter("me_id");
		//me_id 값을 사용하여 해당 회원의 정보를 가져옴. 이 정보는 MemberVO 객체에 저장
		MemberVO member = memberService.getMember(me_id);
		request.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/views/member/update.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//현재 로그인된 사용자 아이디 가져오기
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		String newName= request.getParameter("name");
		String newAddress = request.getParameter("address");
		String newPhone= request.getParameter("phone");
		
		member.setMe_name(newName);
		member.setMe_address(newAddress);
		member.setMe_phone(newPhone);
		
		boolean Ok = false;
		if(memberService.updateMember(member)) {
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		
		doGet(request, response);
		
	}

}