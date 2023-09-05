package kr.kh.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DogVO {
	
	private String d_num;
	private String d_name;
	private String d_age;
	private String d_gen;
	private Integer d_kg;
	private String d_detail;
	private String d_me_id;
	private String d_si_name;
	
	public DogVO(String d_num, String d_name, String d_age, String d_gen, Integer d_kg, String d_detail, String d_me_id,
			String d_si_name) {
		
		this.d_num = d_num;
		this.d_name = d_name;
		this.d_age = d_age;
		this.d_gen = d_gen;
		this.d_kg = d_kg;
		this.d_detail = d_detail;
		this.d_me_id = d_me_id;
		this.d_si_name = d_si_name;
	}
	
	
}