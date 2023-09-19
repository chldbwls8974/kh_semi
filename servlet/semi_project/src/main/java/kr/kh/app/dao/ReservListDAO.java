package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.ReservListVO;

public interface ReservListDAO {

	void insertReservList(@Param("rl")ReservListVO reservlist);

}
