package kr.kh.app.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	private String me_id, me_pw, me_name, me_address, me_phone, me_le_name, me_authority, me_pw2;
	private int me_point, me_total_price;
	
	public MemberVO(String id, String pw, String pw2, String name, String address, String phone, int point, int total, String authority) {
		this.me_id= id;
		this.me_pw=pw;
		this.me_pw2=pw2;
		this.me_name = name;
		this.me_address = address;
		this.me_phone = phone;
		this.me_point = point;
		this.me_total_price = total;
		this.me_authority=authority;
	}
	
	public String toString() {
		return "{\"me_id\" : \"" + me_id + "\"}";
	}



}
