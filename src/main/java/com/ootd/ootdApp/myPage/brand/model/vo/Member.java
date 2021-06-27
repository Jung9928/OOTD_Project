package com.ootd.ootdApp.myPage.brand.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class Member implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 2000L;
	
	private String account_number;
	private String address;
	private String bank_code;
	private String brand_name;
	private String email;
	private Date enroll_date;
	private int login_type;
	private String member_id;
	private String member_name;
	private String member_nickname;
	private int member_no;
	private String member_pw;
	private String phone;

	

}
