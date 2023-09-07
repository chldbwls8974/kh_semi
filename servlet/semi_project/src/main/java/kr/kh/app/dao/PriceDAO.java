package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.PriceVO;

public interface PriceDAO {

	void updatePrice(@Param("price")PriceVO price);

}
