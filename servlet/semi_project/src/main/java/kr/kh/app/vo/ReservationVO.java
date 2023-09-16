package kr.kh.app.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReservationVO {
	private int re_num, re_stay, re_s_count, re_m_count, re_l_count, re_price;
	private int re_real_price, re_use_point, re_add_point;
	private String re_me_id, re_state;
	private Date re_date, re_end_date;
	public ReservationVO(int re_stay, int re_s_count, int re_m_count, int re_l_count, int re_price, int re_real_price,
			int re_use_point, int re_add_point, String re_me_id, String re_state, Date re_date, Date re_end_date) {
		super();
		this.re_stay = re_stay;
		this.re_s_count = re_s_count;
		this.re_m_count = re_m_count;
		this.re_l_count = re_l_count;
		this.re_price = re_price;
		this.re_real_price = re_real_price;
		this.re_use_point = re_use_point;
		this.re_add_point = re_add_point;
		this.re_me_id = re_me_id;
		this.re_state = re_state;
		this.re_date = re_date;
		this.re_end_date = re_end_date;
	}
}
