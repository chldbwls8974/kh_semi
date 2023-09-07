package kr.kh.app.service;

import java.util.ArrayList;
import java.util.List;

import kr.kh.app.vo.RoomVO;

public interface RoomService {

	ArrayList<RoomVO> getRoomList();

	RoomVO getRoom(Integer ro_num);

	boolean insertRoom(RoomVO room);
}