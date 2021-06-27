package com.ootd.ootdApp.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review4view implements Serializable {
	
	private String review_title;
	private String member_nickname;
	private Date review_date;
	private String review_contents;
	private int review_no;
}
