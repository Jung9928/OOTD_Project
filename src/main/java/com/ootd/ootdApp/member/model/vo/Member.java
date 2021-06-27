package com.ootd.ootdApp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements Serializable{
	
	private int member_no;
	private String member_id;
	private String member_nickname;
	private String member_pw;
	private String member_name;
	private String email;
	private String phone;
	private String[] address;
	private Date enroll_date;
	private String brand_name;
	private String account_number;
	private int login_type;
	private String bank_code;

	public Member(String member_id, String member_name, String email) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.email = email;
	}

	public Member(String member_id, String member_pw) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
	}
}
