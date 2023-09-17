package kr.kh.app.service;

import kr.kh.app.vo.LevelVO;

public interface LevelService {

	boolean updateLevel(LevelVO level);

	LevelVO getBenefitLevel(String benefit);

}
