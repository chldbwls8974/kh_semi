package kr.kh.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
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
	
	
}
