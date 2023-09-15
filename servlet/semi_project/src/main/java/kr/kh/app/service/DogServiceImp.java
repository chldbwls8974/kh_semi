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
		DogVO dbDog = dogDao.selectDog(dog.getD_num());
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

	@Override
	public boolean deleteDog(String d_num) {
		return dogDao.deleteDog(d_num) != 0;
	}

	@Override
	public DogVO getDog(String d_num) {
		return dogDao.selectDog(d_num);
	}

	@Override
	public boolean updateDog(DogVO dog) {
		if(dog == null || dog.getD_num() == null) {
			return false;
		}
		return dogDao.updateDog(dog);
	}



}