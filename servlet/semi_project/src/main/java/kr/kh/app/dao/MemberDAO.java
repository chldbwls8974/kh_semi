package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservationVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);

	boolean insertMember(@Param("member")MemberVO member);

	ArrayList<MemberVO> selectMemberList();

	int updateMember(@Param("member")MemberVO member);

	void updatePoint(@Param("me_id")String me_id, @Param("me_point")int myPoint);

	void updateMemberToReserv(@Param("me_id")String me_id, @Param("price")Integer re_real_price);
}
