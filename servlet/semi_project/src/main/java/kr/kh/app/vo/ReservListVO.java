package kr.kh.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor

public class ReservListVO {
	private int rl_num ,rl_ro_num;
	private String rl_d_num , rl_re_num;
	
	public ReservListVO(int rl_num, int rl_ro_num, String rl_d_num, String rl_re_num) {
		super();
		this.rl_num = rl_num;
		this.rl_ro_num = rl_ro_num;
		this.rl_d_num = rl_d_num;
		this.rl_re_num = rl_re_num;
	}
}
