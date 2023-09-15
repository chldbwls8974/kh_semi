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
		//아이디는 영문으로 시작하고, 6~15자
		String idRegex = "^[a-zA-Z][a-zA-Z0-9]{6,9}$";
		//비번은 영문,숫자,!@#$%로 이루어지고 6~15자 
		String pwRegex = "^[a-zA-Z0-9!@#$%]{6,14}$";
		
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
	

	
}