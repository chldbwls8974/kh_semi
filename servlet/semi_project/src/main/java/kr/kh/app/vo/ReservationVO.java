package kr.kh.app.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationVO {
	private int re_num, re_stay, re_s_count, re_m_count, re_l_count, re_price;
	private int re_real_price, re_use_point, re_add_point;
	private String re_me_id, re_state;
	private Date re_date;
}
