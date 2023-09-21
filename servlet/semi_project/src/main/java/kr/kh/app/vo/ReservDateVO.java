package kr.kh.app.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservDateVO {
	private int rd_num, rd_ro_num, rd,br_num;
	private String rd_date;
	
	public ReservDateVO(int rd_num, int rd_ro_num, String rd_date) {
		this.rd_num = rd_num;
		this.rd_ro_num = rd_ro_num;
		this.rd_date = rd_date;
	}
	
	
}
