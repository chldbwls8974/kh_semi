package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.BranchVO;

public interface BranchDAO {


	ArrayList<BranchVO> selectBranchList();

	void insertBranch(@Param("branch")BranchVO branch);



}