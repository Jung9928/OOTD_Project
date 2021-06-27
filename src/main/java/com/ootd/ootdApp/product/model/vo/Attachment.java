package com.ootd.ootdApp.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements Serializable {

	private static final long serialVersionUID = 79337L;
	
	private int att_no;			// 첨부파일 번호	(설명 필요)
	private String att_name;	// 첨부파일 이름	
	private Date att_date;		// 첨부파일 첨부날짜	(sysdate를 사용해서 mapper에서 바로 사용할건지 다른 방법을 쓸건지 설명 필요)
	private int att_level;		// 첨부파일 첨부한 순서
	private char att_status;	// 첨부파일 삭제여부 (y는 파일 활성화, n은 비활성화) (디폴트로 y값을 줄건지 설명 필요)
	private int product_no;		// 상품번호
	
	// 다인
	private int rank;
	private int product_type;
	
	private String originalFileName;
	private String renamedFileName;
	
	public Attachment(String originalFileName, String renamedFileName) {
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
	}
}
