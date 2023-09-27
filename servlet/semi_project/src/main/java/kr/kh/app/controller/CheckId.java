package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//'me_id'라는 이름의 Parameter 값을 추출해서 'id'라는 문자열 변수에 저장
		String id = request.getParameter("me_id");
        
        //아이디 중복 여부 체크
		//멤버서비스 객체의 isIdDuplicate 메서드를 호출하고, 'id' 정보를 줘서 아이디가 중복되는지 확인 
		//-> 메서드를 통해 반환된 값을 boolean 뒤에 있는 'isIdDuplicate' 변수에 저장
        boolean isIdDuplicate = memberService.isIdDuplicate(id);
        
        // 클라이언트에게 전송되는 데이터가 JSON 형식임을 알려줌 
        //-> 클라이언트는 응답으로 받은 데이터가 JSON 형식임을 인식하고, 그에 맞게 데이터를 처리할 수 있게 함 
        response.setContentType("application/json");
        // HTTP 응답의 문자 인코딩을 설정하는 메서드 -> 대부분의 다국어 텍스트를 지원
        response.setCharacterEncoding("UTF-8");
        //클라이언트에게 JSON 형식의 데이터를 전송-> getWriter() 메서드는 클라이언트로 텍스트 데이터를 보낼 수 있는 출력 스트림을 반환
        //isIdDuplicate는 이전 코드에서 계산된 결과를 나타냄(true or false)
        //파란색 글자인 isIdDuplicate는 객체의 속성 이름이고, 갈색 isIdDuplicate는 변수 값 
        response.getWriter().write("{\"isIdDuplicate\": " + isIdDuplicate + "}");
        //=> 따라서, 위의 세 코드는 isIdDuplicate 변수 값을 클라이언트에게 JSON 형식의 응답으로 보내는 것
    }

}
