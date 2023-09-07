package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.LevelVO;

public interface LevelDAO {

	void updateLevel(@Param("level")LevelVO level);

}
