package com.ootd.ootdApp.order.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyList implements Serializable {
	
	private static final long serialVersionUID = 403L;
	
	private int product_no;
	private int cart_quantity;
	private String cart_size;
	private String product_name;
	private String brand_name;
	private int product_price;
	private String att_name;
	
	

}
