package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PointDAO;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.PointVO;

public class PointServiceImp implements PointService{

	private PointDAO pointDao;
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public PointServiceImp() {
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			pointDao = session.getMapper(PointDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean insertPoint(PointVO point) {
		if(point == null) {
			return false;
		}
		return pointDao.insertPoint(point);
	}

	@Override
	public ArrayList<PointVO> selectPointList() {
		return pointDao.selectPointList();
	}


}
