package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.SizeVO;

public interface SizeDAO {

	void updateSize(@Param("size")SizeVO size);


}
