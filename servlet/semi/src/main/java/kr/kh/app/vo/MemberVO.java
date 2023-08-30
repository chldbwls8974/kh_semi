package kr.kh.app.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_address;
	private String me_phone;
	
	public MemberVO(String id, String pw, String name, String address, String phone) {
		this.me_id= id;
		this.me_pw=pw;
		this.me_name = name;
		this.me_address = address;
		this.me_phone = phone;
	}


}
