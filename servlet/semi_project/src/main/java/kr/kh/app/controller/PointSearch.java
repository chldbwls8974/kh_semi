package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.json.JSONArray;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.vo.MemberVO;

public class PointSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
       
    public PointSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("po_search");
		ArrayList<MemberVO> list = memberService.getMemberSearch(search);
		JSONArray jsonArray = new JSONArray(list);
		request.setAttribute("list", jsonArray.toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		ArrayList<String> list = new ArrayList();
		list.add("1");
		list.add("2");
		list.add("3");
		
		for(String tmp : list) {
			System.out.println(tmp);
		}
	}

}
