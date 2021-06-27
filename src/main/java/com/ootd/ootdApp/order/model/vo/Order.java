package com.ootd.ootdApp.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order implements Serializable{

	private static final long serialVersionUID = 401L;
	
	// member 테이블에서 주문 회원 정보 불러와야함  -- member테이블 통해서
	//	private int member_no;
	//	private String member_id;
	//	private String member_name;
	//	private String email;
	//	private String phone;
	//	private String address;
	//	private Date enroll_date;
	//	private String brand_name;
	//	private String account_number;
	//	private String bank_code;

	
	// 결제완료시 input을 위한 order datad
	private int order_no;
	private String receiver_name;
	private String order_address;
	private Date order_date;
	private String order_memo;
	private int total_price;
	private int member_no;


	
	// cart 테이블통해서 -- 굳이 여기엔 없어도 될 것 같음
	//	private int cart_quantity;   // ajax로 바뀐 수량 그대로 가져옴
	//	private String cart_size;
	//	private int product_no;
	
	// product 테이블 통해서
	// private int product_price;
	
	
	
	
	
     
}
