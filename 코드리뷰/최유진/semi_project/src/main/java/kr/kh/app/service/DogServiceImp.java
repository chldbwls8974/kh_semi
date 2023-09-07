package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.DogDAO;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public class DogServiceImp implements DogService {
	private DogDAO dogDao;
	
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public DogServiceImp (){
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			dogDao = session.getMapper(DogDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean insertDog(DogVO dog) {
		if(dog == null) {
			return false;
		}
		DogVO dbDog = dogDao.selectDog(dog.getD_name());
		if(dbDog != null) {
			return false;
		}
		dogDao.insertDog(dog);
		return true;
	}

	@Override
	public ArrayList<DogVO> getMyDogList(MemberVO user) {
		
		return dogDao.selectMyDogList(user);
	}

}