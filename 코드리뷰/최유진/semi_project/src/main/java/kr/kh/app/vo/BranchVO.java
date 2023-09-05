package kr.kh.app.vo;

import lombok.Data;

@Data
public class BranchVO {
	private int br_num;
	private String br_name;
	private String br_phone;
	private int br_lo_num;

<<<<<<< HEAD:코드리뷰/최유진/semi_project/src/main/java/kr/kh/app/vo/BranchVO.java
	public BranchVO(int num, String name, String phone, int br_lo_num) {
		this.br_num = num;
=======
	public BranchVO(String name, String phone) {
>>>>>>> 4132233da10b8b8ba13ce6a046097bb301f69900:코드리뷰/임은영/BranchVO
		this.br_name = name;
		this.br_phone = name;
		this.br_lo_num = br_lo_num;
	}
}