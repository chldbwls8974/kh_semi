package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ReservDAO;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.PriceVO;
import kr.kh.app.vo.ReservationVO;

public class ReservServiceImp implements ReservService{
	
	ReservDAO reservDao;
	DogService dogService = new DogServiceImp();
	PriceService priceService = new PriceServiceImp();
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
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


	@Override
	public ArrayList<ReservationVO> getMyReservArray(MemberVO user) {
		return reservDao.selectMyReservArray(user);
	}


	@Override
	public boolean insertReserv(ReservationVO reserv) {
		if(reserv == null) {
			return false;
		}
		
		return reservDao.insertReserv(reserv);
	}


	@Override
	public ReservationVO createVO(String re_me_id, String from, String to, String br_num, String d_num1, String d_num2,
			String d_num3, int re_use_point) {
		
		//현재 d_num2, d_num3은 null값임
		DogVO dog1 = dogService.getDog(d_num1);
		DogVO dog2 = dogService.getDog(d_num2);
		DogVO dog3 = dogService.getDog(d_num3);
		
		//if(dog == null)이면 d_si_name에 null 아니면 사이즈이름 넣어주기
		String d_si_name1 = (dog1 == null) ? null : dog1.getD_si_name();
		String d_si_name2 = (dog2 == null) ? null : dog2.getD_si_name();
		String d_si_name3 = (dog3 == null) ? null : dog3.getD_si_name();
		
		//사이즈별 마리 수 구해오기
		int re_s_count = smallCount(d_si_name1,d_si_name2,d_si_name3);
		int re_m_count = mediumCount(d_si_name1,d_si_name2,d_si_name3);
		int re_l_count = largeCount(d_si_name1,d_si_name2,d_si_name3);
		
		//사이즈별 시세 가져오기
		PriceVO sPrice = priceService.getSizePrice("s");
		PriceVO mPrice = priceService.getSizePrice("m");
		PriceVO lPrice = priceService.getSizePrice("l");
		
		//총 가격
		int totalPrice = (re_s_count * sPrice.getPr_price()) + (re_m_count * mPrice.getPr_price()) + (re_l_count * lPrice.getPr_price());
		
		//이용일수 계산해서 가져오는 메서드
//		int re_stay = reservService.calStayDay(from, to);
		
		//실 결제 금액
		int re_real_price = totalPrice - re_use_point;
		int re_add_point = 0; // me_id의 등급 판별 -> 해당 등급의 적립률 가져오기 -> 실 결제금액 * 적립률 / 100 = 적립포인트 
		
		
		ReservationVO reserv = new ReservationVO(re_s_count, re_m_count, re_l_count, totalPrice, re_real_price,
				 re_use_point, re_add_point, re_me_id,  from,  to);
		
		return reserv;
	}


}
