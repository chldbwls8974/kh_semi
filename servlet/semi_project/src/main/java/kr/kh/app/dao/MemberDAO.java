package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);

	boolean insertMember(@Param("member")MemberVO member);

	ArrayList<MemberVO> selectMemberList();

	int updateMember(@Param("member")MemberVO member);
}
