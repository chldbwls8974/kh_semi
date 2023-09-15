package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservationVO;

public interface ReservDAO {

	ArrayList<ReservationVO> selectMyReservArray(@Param("user")MemberVO user);


}
