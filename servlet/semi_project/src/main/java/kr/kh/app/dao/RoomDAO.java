package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.RoomVO;

public interface RoomDAO {

	ArrayList<RoomVO> selectRoomList();

	RoomVO selectRoom(@Param("ro_num") Integer ro_num);

	boolean updateRoom(@Param("room") RoomVO room);

	int deleteRoom(@Param("ro_num") int ro_num);

	void insertRoom(@Param("room") RoomVO room);
	
}
