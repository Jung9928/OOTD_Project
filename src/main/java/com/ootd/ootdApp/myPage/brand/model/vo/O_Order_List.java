package com.ootd.ootdApp.myPage.brand.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class O_Order_List implements Serializable {

	private static final long serialVersionUID = 2L;

	private char order_size;
	private int order_quantity;
	private int order_no;
	private int product_no;
	private int order_status;
}