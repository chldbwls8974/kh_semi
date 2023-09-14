package kr.kh.app.service;

import kr.kh.app.vo.PriceVO;

public interface PriceService {

	boolean updatePrice(PriceVO price);

	PriceVO getSizePrice(String size);

}
