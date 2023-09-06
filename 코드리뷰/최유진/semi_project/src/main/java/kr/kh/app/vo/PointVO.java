package kr.kh.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointVO {
	private int po_num, po_point;
	private String po_content, po_me_id;
	
	
	public PointVO(int po_point, String po_content, String po_me_id) {
		this.po_point = po_point;
		this.po_content = po_content;
		this.po_me_id = po_me_id;
	}
	
	
}
