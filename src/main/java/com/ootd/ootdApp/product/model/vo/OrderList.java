package com.ootd.ootdApp.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderList {
	
	private String order_size;
	private int order_quantity;
	private int order_no;
	private int product_no;

}
