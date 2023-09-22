package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.vo.ReservDateVO;

public interface ReservDateDAO {

	void insertReservDate(@Param("r_num")int r_num,@Param("br_num") int br_num, @Param("date")String date);

	ArrayList<ReservDateVO> selectDateRoom(@Param("start_date")String start_date, @Param("end_date")String end_date,@Param("br_num") Integer br_num);

}
