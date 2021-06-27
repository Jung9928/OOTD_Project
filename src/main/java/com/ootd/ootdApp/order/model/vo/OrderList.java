package com.ootd.ootdApp.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList implements Serializable{
	
	private static final long serialVersionUID = 402L;
		
	// orderList에 input 하기 위함
	private String order_size;
	private int order_quantity;
	private int order_no;
	private int product_no;
	private int order_status;
}


