package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.ReservListVO;

public interface ReservListService {

	void insertReservList(ReservListVO reservlist);

	ArrayList<ReservListVO> getReservListArray(String rl_re_num);

}
