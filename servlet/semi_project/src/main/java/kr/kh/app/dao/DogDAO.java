package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservListVO;

public interface DogDAO {

	DogVO selectDog(@Param("d_num")String d_num);

	void insertDog(@Param("dog")DogVO dog);

	ArrayList<DogVO> selectMyDogList(@Param("user")MemberVO user);

	int deleteDog(@Param("d_num")String d_num);

	boolean updateDog(@Param("dog")DogVO dog);
 
	ArrayList<DogVO> selectDogList();

	ArrayList<DogVO> searchDogUser(@Param("d_search")String d_search);

}
