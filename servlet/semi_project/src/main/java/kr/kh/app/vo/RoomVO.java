package kr.kh.app.vo;

import lombok.Data;

@Data
public class RoomVO {
	
	private int ro_num;
	private String ro_name;
	private int ro_max_cap;
	private int ro_now_cap; 
	private int ro_br_num;
	
	public RoomVO(String ro_name, int ro_max_cap, int ro_now_cap, int ro_br_num) {
		this.ro_name = ro_name;
		this.ro_max_cap = ro_max_cap;
		this.ro_now_cap = ro_now_cap;
		this.ro_br_num = ro_br_num;
	}
}
