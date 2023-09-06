package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.DogVO;
import kr.kh.app.vo.MemberVO;

public interface DogService {

	boolean insertDog(DogVO dog);

	ArrayList<DogVO> getMyDogList(MemberVO user);

}