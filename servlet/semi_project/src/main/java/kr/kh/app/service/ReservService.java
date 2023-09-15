package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservationVO;

public interface ReservService {

	int smallCount(String str1, String str2, String str3);

	int mediumCount(String str1, String str2, String str3);

	int largeCount(String str1, String str2, String str3);

	int calStayDay(String from, String to);

	ArrayList<ReservationVO> getMyReservArray(MemberVO user);

}
