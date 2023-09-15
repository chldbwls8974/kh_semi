package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.PointVO;

public interface PointDAO {

	boolean insertPoint(@Param("point")PointVO point);

	ArrayList<PointVO> selectPointList();


}
