package kr.kh.app.service;

import kr.kh.app.vo.ReservListVO;

public interface ReservListService {

	void insertReservList(ReservListVO reservlist);

	ReservListVO getReservList(Integer rl_num);


}
