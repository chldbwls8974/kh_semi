package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.vo.BranchVO;
import kr.kh.app.vo.MemberVO;

public interface BranchService {

	ArrayList<BranchVO> getBranchList();

	boolean insertBranch(BranchVO branch);

	boolean deleteBranch(int br_num);

	BranchVO getBranch(int br_num);



}
