package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ReservDAO;

public class ReservServiceImp implements ReservService{
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	ReservDAO reservDao;
	public ReservServiceImp() {
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			reservDao = session.getMapper(ReservDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public int smallCount(String str1, String str2, String str3) {
		//추후에 매개변수 3개 받아와서 스몰 몇마리인지 리턴하는 메서드
		//개 1마리값만 들어오면 나머지 개선택 2개는 null이라서 예외발생함
		int count = 0;
		if(str1 != null) {
			if(str1.equals("s")) {count++;}
		}
		if(str2 != null) {
			if(str2.equals("s")) {count++;}
		}
		if(str3 != null) {
			if(str3.equals("s")) {count++;}
		}
		
		return count;
	}
	@Override
	public int mediumCount(String str1, String str2, String str3) {
		int count = 0;
		if(str1 != null) {
			if(str1.equals("m")) {count++;}
		}
		if(str2 != null) {
			if(str2.equals("m")) {count++;}
		}
		if(str3 != null) {
			if(str3.equals("m")) {count++;}
		}
		return count;
	}
	@Override
	public int largeCount(String str1, String str2, String str3) {
		int count = 0;
		if(str1 != null) {
			if(str1.equals("l")) {count++;}
		}
		if(str2 != null) {
			if(str2.equals("l")) {count++;}
		}
		if(str3 != null) {
			if(str3.equals("l")) {count++;}
		}
		return count;
	}


	@Override
	public int calStayDay(String from, String to) {
		//숙박일 계산
		LocalDate fromDate = LocalDate.parse(from);
		LocalDate toDate = LocalDate.parse(to);
		return (toDate.getDayOfMonth() - fromDate.getDayOfMonth()) + 1;
	}
}
