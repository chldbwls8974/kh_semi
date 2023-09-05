package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.BranchVO;

public interface BranchDAO {
<<<<<<< HEAD:코드리뷰/최유진/semi_project/src/main/java/kr/kh/app/dao/BranchDAO.java

	void insertBranch(@Param("branch")BranchVO branch);
=======

	ArrayList<BranchVO> selectBranchList();

	void insertBranch(@Param("branch")BranchVO branch);

>>>>>>> 4132233da10b8b8ba13ce6a046097bb301f69900:코드리뷰/임은영/BranchDAO


}