package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PriceDAO;
import kr.kh.app.vo.PriceVO;

public class PriceServiceImp implements PriceService{
	private PriceDAO priceDao;
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public PriceServiceImp (){
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			priceDao = session.getMapper(PriceDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean updatePrice(PriceVO price) {
		if(price == null) {
			return false;
		}
		
		priceDao.updatePrice(price);
		return true;
	}

	@Override
	public PriceVO getSizePrice(String size) {
		return priceDao.getSizePrice(size);
	}
}
