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
import kr.kh.app.vo.SizeVO;

public class SizeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    SizeService sizeService = new SizeServiceImp();   
    public SizeUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SizeVO sSize = sizeService.getPriceSize("s");
		SizeVO mSize = sizeService.getPriceSize("m");
		SizeVO lSize = sizeService.getPriceSize("l");
		request.setAttribute("sSize", sSize);
		request.setAttribute("mSize", mSize);
		request.setAttribute("lSize", lSize);
		request.getRequestDispatcher("/WEB-INF/views/size/update.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Integer smallMinKg = Integer.parseInt(request.getParameter("si_min_kg_s"));
			Integer mediumMinKg = Integer.parseInt(request.getParameter("si_min_kg_m"));
			Integer largeMinKg = Integer.parseInt(request.getParameter("si_min_kg_l"));
			
			SizeVO sSize = new SizeVO("s", smallMinKg);
			SizeVO mSize = new SizeVO("m", mediumMinKg);
			SizeVO lSize = new SizeVO("l", largeMinKg);
			// 메서드 1개로 3번 실행되게 (소, 중, 대)
			
			boolean Ok = false;
			if(sizeService.updateSize(sSize) &&
					sizeService.updateSize(mSize) &&
					sizeService.updateSize(lSize)) {
				Ok = true;
			}
			request.setAttribute("Ok", Ok);
			
			
			doGet(request, response);
	}

}
