package kr.kh.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVO {
	
	private int ro_num;
	private String ro_name;
	private String ro_detail;
	private int ro_max_cap;
	private int ro_now_cap; 
	private int ro_br_num;
	
	public RoomVO(String ro_name, int ro_max_cap, int ro_now_cap, int ro_br_num, String ro_detail) {
		this.ro_name = ro_name;
		this.ro_detail = ro_detail;
		this.ro_max_cap = ro_max_cap;
		this.ro_now_cap = ro_now_cap;
		this.ro_br_num = ro_br_num;
	}
}
