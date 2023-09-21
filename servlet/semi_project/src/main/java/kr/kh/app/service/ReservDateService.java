package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.ReservDateVO;

public interface ReservDateService {


	void insertReservDate(int r_num, String br_num, String date);

	ArrayList<ReservDateVO> selectDateRoom(String start_date, String end_date, Integer br_num);


}
