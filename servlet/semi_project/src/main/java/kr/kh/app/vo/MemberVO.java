package kr.kh.app.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id, me_pw, me_name, me_address, me_phone, me_le_name, me_authority;
	private int me_point, me_total_price;
	
	public MemberVO(String id, String pw, String name, String address, String phone, int point, int total, String authority) {
		this.me_id= id;
		this.me_pw=pw;
		this.me_name = name;
		this.me_address = address;
		this.me_phone = phone;
		this.me_point = point;
		this.me_total_price = total;
		this.me_authority=authority;
	}



}
