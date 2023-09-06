package kr.kh.app.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_address;
	private String me_phone;
	private int me_point;
	
	public MemberVO(String id, String pw, String name, String address, String phone, int point) {
		this.me_id= id;
		this.me_pw=pw;
		this.me_name = name;
		this.me_address = address;
		this.me_phone = phone;
		this.me_point = point;
	}



}
