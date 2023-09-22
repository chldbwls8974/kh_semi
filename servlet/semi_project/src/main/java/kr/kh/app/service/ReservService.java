package kr.kh.app.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservationVO;

public interface ReservService {

	int smallCount(String str1, String str2, String str3);

	int mediumCount(String str1, String str2, String str3);

	int largeCount(String str1, String str2, String str3);

	List<LocalDate> calStayDay(String from, String to);

	ArrayList<ReservationVO> getMyReservArray(MemberVO user);

	boolean insertReserv(ReservationVO reserv);

	ReservationVO createVO(String re_num, String re_me_id, String from, String to, String br_num, String d_num1, String d_num2,
			String d_num3, int re_use_point);

	boolean updateReserv(ReservationVO reserv);

	boolean isCorrectSelect(String br_num, String[] dataArray, String[] roomArray);

	ArrayList<ReservationVO> getReservArray();

	void updateReservState(ReservationVO reserv);


}
