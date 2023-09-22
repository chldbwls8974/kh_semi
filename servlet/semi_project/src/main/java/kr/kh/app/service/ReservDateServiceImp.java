package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ReservDateDAO;
import kr.kh.app.vo.ReservDateVO;

public class ReservDateServiceImp implements ReservDateService {
	ReservDateDAO reservDateDao;
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public ReservDateServiceImp() {
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			reservDateDao = session.getMapper(ReservDateDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertReservDate(int r_num, String num, String date) {
	      
		try{
	            int br_num = Integer.parseInt(num);
	            if(r_num == 0 || br_num == 0 || date ==null) {
					return;
				}
	            reservDateDao.insertReservDate(r_num,br_num, date);
	        }
	        catch (NumberFormatException ex){
	            ex.printStackTrace();
	        }
	}

	@Override
	public ArrayList<ReservDateVO> selectDateRoom(String start_date, String end_date, Integer br_num) {
		return reservDateDao.selectDateRoom(start_date, end_date, br_num);
	}




}
