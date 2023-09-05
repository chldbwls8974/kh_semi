package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.BranchVO;

public interface BranchService {

	boolean insertBranch(BranchVO branch);

	ArrayList<BranchVO> getBranchList();

}