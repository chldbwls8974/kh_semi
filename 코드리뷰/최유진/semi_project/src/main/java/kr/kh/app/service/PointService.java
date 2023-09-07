package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.PointVO;

public interface PointService {

	boolean insertPoint(PointVO point);

	ArrayList<PointVO> selectPointList();


}
