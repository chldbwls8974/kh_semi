package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.SizeDAO;
import kr.kh.app.vo.SizeVO;

public class SizeServiceImp implements SizeService {
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	private SizeDAO sizeDao;
	
	public SizeServiceImp() {
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			sizeDao = session.getMapper(SizeDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean updateSize(SizeVO size) {
		if(size == null) {
			return false;
		}
		
		sizeDao.updateSize(size);
		return true;
	}

	@Override
	public SizeVO getSize(String si_name) {
		return sizeDao.selectSize(si_name);
	}

	@Override
	public SizeVO getPriceSize(String price) {
		return sizeDao.getPriceSize(price);
	}

}
