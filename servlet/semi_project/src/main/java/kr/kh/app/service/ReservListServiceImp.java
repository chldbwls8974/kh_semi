package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ReservListDAO;
import kr.kh.app.vo.ReservListVO;

public class ReservListServiceImp implements ReservListService{

	ReservListDAO reservListDao;
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public ReservListServiceImp() {
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			reservListDao = session.getMapper(ReservListDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertReservList(ReservListVO reservlist) {
		if(reservlist==null) {
			return;
		}
		reservListDao.insertReservList(reservlist);
	}

}
