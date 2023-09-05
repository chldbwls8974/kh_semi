package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.BranchVO;

public interface BranchDAO {

	void insertBranch(@Param("branch")BranchVO branch);


}