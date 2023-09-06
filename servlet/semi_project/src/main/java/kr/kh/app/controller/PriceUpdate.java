package kr.kh.app.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.kh.app.service.PriceService;
import kr.kh.app.service.PriceServiceImp;
import kr.kh.app.vo.PriceVO;
import kr.kh.app.vo.SizeVO;

public class PriceUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PriceService priceService = new PriceServiceImp();
    
    
    public PriceUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/price/update.jsp").forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer smallPrice = Integer.parseInt(request.getParameter("pr_price_s"));
		Integer mediumPrice = Integer.parseInt(request.getParameter("pr_price_m"));
		Integer largePrice = Integer.parseInt(request.getParameter("pr_price_l"));
		
		PriceVO sPrice = new PriceVO("s", smallPrice);
		PriceVO mPrice = new PriceVO("m", mediumPrice);
		PriceVO lPrice = new PriceVO("l", largePrice);
		// 메서드 1개로 3번 실행되게 (소, 중, 대)
		// 변수 3개를 화면에서 받아와서 updatePrice(s,m,l)처럼 인티저 3개로 넘겨줘서 처리??
		// -> 서비스에서 priceDao.updatePrice(price); 객체 3개 만들어서 세번하면 됨.
		boolean Ok = false;
		if(priceService.updatePrice(sPrice) &&
				priceService.updatePrice(mPrice) &&
				priceService.updatePrice(lPrice)){
			Ok = true;
		}
		request.setAttribute("Ok", Ok);
		
		
		doGet(request, response);
	}

}







