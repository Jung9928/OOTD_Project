package com.ootd.ootdApp.myPage.brand.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class MypageOrderList implements Serializable {
	
	// Order + OrderList 
	// 마이페이지 주문내역을 위한 객체

	private static final long serialVersionUID = 3L;

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
	private String product_name;
		

	}


