package com.ootd.ootdApp.member.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bank implements Serializable{
	
	private String bank_code;
	private String bank_name;
	
	
}
