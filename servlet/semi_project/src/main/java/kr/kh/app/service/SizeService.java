package kr.kh.app.service;


import kr.kh.app.vo.SizeVO;

public interface SizeService {

	boolean updateSize(SizeVO size);

	String getSize(String si_name); //객실보기-방타입에 넣기위함

}
