package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(MemberVO member);

	ArrayList<MemberVO> selectMemberList();

	MemberVO getMember(String me_id);

	boolean updateMember(MemberVO member);

	boolean isIdDuplicate(String id);

}