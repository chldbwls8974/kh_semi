package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public interface DogDAO {

	DogVO selectDog(@Param("d_num")String d_num);

	void insertDog(@Param("dog")DogVO dog);

	ArrayList<DogVO> selectMyDogList(@Param("user")MemberVO user);

}
