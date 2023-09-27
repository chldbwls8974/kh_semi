package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.regex.Pattern;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.MemberDAO;
import kr.kh.app.vo.LevelVO;
import kr.kh.app.vo.MemberVO;

public class MemberServiceImp implements MemberService {
	
	
	private MemberDAO memberDao;
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public MemberServiceImp() {
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			memberDao = session.getMapper(MemberDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean signup(MemberVO member) {
		if(member == null ) {
			return false;
		}
		
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		if(dbMember != null) {
			return false;
		}
		if(!member.getMe_pw().equals(member.getMe_pw2())) {
			return false;
		}
		//아이디, 비번 null 체크 + 유효성 검사
		//아이디는 영문,숫자 6자에서 15자
		String idRegex = "^\\w{6,15}$";
		//비번은 영문,숫자,!@#$%로 이루어지고 8~20자 
		String pwRegex = "^[a-zA-Z0-9!@#$%]{8,20}$";
		
		//아이디가 유효성에 맞지 않으면
		if(!Pattern.matches(idRegex, member.getMe_id())) {
			return false;
		}
		//비번이 유효성에 맞지 않으면
		if(!Pattern.matches(pwRegex, member.getMe_pw())) {
			return false;
		}
		
		memberDao.insertMember(member);
		return true;
		
	}

	@Override
	public MemberVO login(MemberVO member) {
		if(member.getMe_id() == null || member.getMe_pw()==null) {
			return null;
		}
		//로그인 시도 한 id를 이용해서 db의 유저정보를 가져옴
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		if(dbMember == null) {
			return null;
		}
	
		if(member.getMe_pw().equals(dbMember.getMe_pw())) {
			return dbMember;
		}
		return null;
	}

	@Override
	public ArrayList<MemberVO> selectMemberList() {
		return memberDao.selectMemberList();
	}

	@Override
	public MemberVO getMember(String me_id) {
		return memberDao.selectMember(me_id);
	}

	@Override
	public boolean updateMember(MemberVO member) {
		if(member == null || member.getMe_name() == null || member.getMe_address() == null || member.getMe_phone() == null) {
			return false;
		}
		return memberDao.updateMember(member) != 0;
	}
	
	//아이디 중복 확인
	@Override
	public boolean isIdDuplicate(String id) {
		//멤버다오 객체를 사용해서 DB에서 selectMember 메서드를 통하여 전달된 인자(id) 값으로 회원정보 조회
		// -> 결과 값은 VO의 dbMember 변수에 저장
	    MemberVO dbMember = memberDao.selectMember(id);
	    
	    //dbMember 변수가 null이 아니면 true를 반환, 그렇지 않으면 false를 반환
	    return dbMember != null;
	}

	@Override
	public void updateUserPoint(String me_id, int myPoint) {
		memberDao.updatePoint(me_id, myPoint);
	}

	@Override
	public void updateTotalPrice(String me_id, Integer re_real_price, LevelVO level) {
		memberDao.updateMemberToReserv(me_id, re_real_price, level.getLe_benefit());
		
		
	}

	@Override
	public boolean deleteMember(MemberVO member) {
		return memberDao.deleteMember(member);
	}

	@Override
	public ArrayList<MemberVO> getMemberSearch(String search) {
		if(search == null) {
			return null;
		}
		return memberDao.selectMemberSelect(search);
	}

	@Override
	public void updateLevel(LevelVO level) {
		memberDao.updateLevel(level.getLe_benefit());
		
	}

}