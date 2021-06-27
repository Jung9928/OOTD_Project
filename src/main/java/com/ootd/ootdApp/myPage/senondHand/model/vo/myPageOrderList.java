package com.ootd.ootdApp.myPage.senondHand.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class myPageOrderList {
	
	private char order_size;
	private int order_quantity;
	private int order_no;
	private int product_no;
	private String receiver_name;
	private String order_address;
	private Date order_date;
	private String order_memo;
	private int total_price;
	private int member_no;
	private int order_status;
	private String product_name;
	private String brand_name;
	
}
