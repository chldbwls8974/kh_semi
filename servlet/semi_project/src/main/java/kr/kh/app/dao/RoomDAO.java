package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.RoomVO;

public interface RoomDAO {

	ArrayList<RoomVO> selectRoomList();

	RoomVO selectRoom(@Param("ro_num") Integer ro_num);

	boolean updateRoom(@Param("room") RoomVO room);

	boolean deleteRoom(@Param("ro_num") int ro_num);

	void insertRoom(@Param("room") RoomVO room);

	ArrayList<RoomVO> selectRoomByBranch(@Param("br_num")Integer br_num);

	ArrayList<RoomVO> selectReservationRoom(@Param("start_date")String start_date,@Param("end_date") String end_date,@Param("br_num") Integer br_num, @Param("d_size")String d_size);

	
}
