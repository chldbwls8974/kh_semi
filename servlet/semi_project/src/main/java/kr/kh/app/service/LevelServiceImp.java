package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.LevelDAO;
import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.LevelVO;

public class LevelServiceImp implements LevelService{
	LevelDAO levelDao;
	private final String MYBATIS_CONFIG_PATH="kr/kh/app/config/mybatis-config.xml";
	
	public LevelServiceImp (){
		try {
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			levelDao = session.getMapper(LevelDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean updateLevel(LevelVO level) {
		if(level == null) {
			return false;
		}
		
		levelDao.updateLevel(level);
		return true;
	}
}
