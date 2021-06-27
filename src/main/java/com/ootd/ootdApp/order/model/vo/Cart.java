package com.ootd.ootdApp.order.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart implements Serializable{
	
	private static final long serialVersionUID = 400L;
	
	private int cart_no;
	private int member_no;
	private int cart_quantity;
	private String cart_size;
	private int product_no;
	
	private String brand_name;

	private String product_name;
	private int product_price;
	
	private String att_name;
	private int product_type;
	
}
