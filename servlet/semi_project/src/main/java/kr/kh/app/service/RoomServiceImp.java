package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.RoomDAO;
import kr.kh.app.vo.RoomVO;

public class RoomServiceImp implements RoomService {
	private RoomDAO roomDao;
	
	public RoomServiceImp() {
		try {
			final String MYBATIS_CONFIG_PATH = "kr/kh/app/config/mybatis-config.xml";
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			//true의 역할 : 쿼리(insert,update,delete) 실행 후 자동 커밋되게 해줌 
			SqlSession session = sf.openSession(true);
			roomDao = session.getMapper(RoomDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<RoomVO> getRoomList() {
		return roomDao.selectRoomList();
	}

	@Override
	public RoomVO getRoom(Integer ro_num) {
		//매개변수 체크
		if(ro_num == null) {
			return null;
		}
		return roomDao.selectRoom(ro_num);
	}

	@Override
	public boolean insertRoom(RoomVO room) {
		return false;
	}
	
}
