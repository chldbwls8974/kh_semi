package kr.kh.app.vo;

import lombok.Data;

@Data
public class BranchVO {
	private int br_num;
	private String br_name;
	private String br_phone;
	private int br_lo_num;

	public BranchVO(int num, String name, String phone, int br_lo_num) {
		this.br_num = num;
		this.br_name = name;
		this.br_phone = name;
		this.br_lo_num = br_lo_num;
	}
}