package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.PointVO;

public interface PointService {

	boolean insertPoint(PointVO point);

	ArrayList<PointVO> selectPointList();

	void updatePoint(PointVO point);

	ArrayList<PointVO> getMyPointList(MemberVO user);

	boolean deletePoint(PointVO point);

	int getUserPoint(String me_id);



}
