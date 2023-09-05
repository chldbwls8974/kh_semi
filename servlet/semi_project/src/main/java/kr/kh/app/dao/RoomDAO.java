package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.RoomVO;

public interface RoomDAO {

	ArrayList<RoomVO> selectRoomList();

	RoomVO selectRoom(@Param("ro_num") Integer ro_num);
	
}
