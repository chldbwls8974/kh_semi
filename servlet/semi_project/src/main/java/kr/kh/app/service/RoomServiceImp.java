package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.MemberDAO;
import kr.kh.app.dao.ReservDateDAO;
import kr.kh.app.dao.RoomDAO;
import kr.kh.app.vo.RoomVO;

public class RoomServiceImp implements RoomService {
	private RoomDAO roomDao;
	private MemberDAO memberDao;
	private ReservDateDAO reservDateDao;
	
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
		//매개변수 체크
		if(room == null || room.getRo_name() == null) {
			return false;
		}
//		//관리자가 맞는지 확인 < 보류
//		MemberVO member = memberDao.selectAdmin("admin".equals("user"));
//		if(member == null) {
//			return false;
//		}
		//모두 성립한다면 방 추가하기
		roomDao.insertRoom(room);
		return true;
	}

	@Override
	public boolean updateRoom(RoomVO room) {
		//매개변수 체크 (방이 없거나 방 이름이 없으면 false)
		if(room == null || room.getRo_name() == null) {
			System.out.println("11");
			return false;
		}
		//있다면 다오에게 요청
		return roomDao.updateRoom(room);
	}

	@Override
	public boolean deleteRoom(int ro_num) {
		return roomDao.deleteRoom(ro_num);
	}


	@Override
	public ArrayList<RoomVO> getRoomListByBranchAndSize(Integer br_num, String d_size) {
		return roomDao.selectReservationRoom(br_num, d_size);
	}

	@Override
	public ArrayList<RoomVO> getRoomListByBranch(Integer br_num) {
		return roomDao.selectRoomByBranch(br_num);
	}

	@Override
	public ArrayList<RoomVO> getRoomListByDate() {
		return roomDao.getRoomListByDate(today());
	}
	

	public String today() {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	        Calendar c = Calendar.getInstance();
	        c.add(Calendar.DATE,1);
		 String today = sdf.format(c.getTime());
		 return today;
	}
	
}
