package com.ootd.ootdApp.myPage.senondHand.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review_ProductInfo {
	
	private int product_no;
	private String att_name;
	private String brand_name;
	private String product_name;
	private String order_size;
	private Date order_date;
	private String total_price;
}
