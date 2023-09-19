package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.PointVO;

public interface PointDAO {

	boolean insertPoint(@Param("point")PointVO point);

	ArrayList<PointVO> selectPointList();

	void updatePoint(@Param("point")PointVO point);

	ArrayList<PointVO> selectMyPointList(@Param("user")MemberVO user);

	int deletePoint(@Param("point")PointVO point);

	Integer getUserPoint(@Param("me_id")String me_id);


}
