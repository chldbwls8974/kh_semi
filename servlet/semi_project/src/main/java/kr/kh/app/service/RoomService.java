package kr.kh.app.service;

import java.util.ArrayList;
import java.util.List;

import kr.kh.app.vo.RoomVO;

public interface RoomService {

	ArrayList<RoomVO> getRoomList();

	RoomVO getRoom(Integer ro_num);

	boolean insertRoom(RoomVO room);

	boolean updateRoom(RoomVO room);

	boolean deleteRoom(int ro_num);

	ArrayList<RoomVO> getRoomListByBranch(Integer br_num);

	ArrayList<RoomVO> getRoomListByBranchAndSize(String start_date, String end_date, Integer br_num, String d_size);
}
