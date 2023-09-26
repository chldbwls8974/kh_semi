package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;
import kr.kh.app.vo.ReservListVO;

public interface DogService {

	boolean insertDog(DogVO dog);

	ArrayList<DogVO> getMyDogList(MemberVO user);

	boolean deleteDog(String d_num);

	DogVO getDog(String d_me_id);

	boolean updateDog(DogVO dog);

	ArrayList<DogVO> getDogList();

	ArrayList<DogVO> searchDogList(String d_search);

	void allDogSizeUpdate(Integer smallMinKg, Integer mediumMinKg, Integer largeMinKg);


}
