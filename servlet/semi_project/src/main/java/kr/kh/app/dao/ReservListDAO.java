package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import kr.kh.app.vo.ReservListVO;

public interface ReservListDAO {

	void insertReservList(@Param("rl")ReservListVO reservlist);

	/* ReservListVO selectReservList(@Param("rl_re_num")String rl_re_num); */

	ArrayList<ReservListVO> selectReservListArray(@Param("rl_re_num")String rl_re_num);

}
