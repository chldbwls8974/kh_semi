package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ReservDateDAO;

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
	public void calculateDate(Date start_date, Date end_date) {
		
	}

}
