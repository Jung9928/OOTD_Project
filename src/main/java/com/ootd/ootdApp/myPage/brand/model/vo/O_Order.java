package com.ootd.ootdApp.myPage.brand.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class O_Order implements Serializable {
	
	private static final long serialVersionUID = 222L;
	
	private int order_no;
	private String receiver_name;
	private String order_address;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date order_date;
	private String order_memo;
	private int total_price;
	private int member_no;
	private int product_no;
	private String product_size;
	private String product_name;
	private int order_quantity;
	private String brand_name;
	private int order_status;
}
