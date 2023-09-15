package kr.kh.app.vo;

import lombok.Data;

@Data
public class PointVO {
	private int po_num, po_point;
	private String po_content, po_me_id;
	
	
	public PointVO(int po_num, int po_point, String po_content, String po_me_id) {
		this.po_num = po_num;
		this.po_point = po_point;
		this.po_content = po_content;
		this.po_me_id = po_me_id;
	}
	
	
}
