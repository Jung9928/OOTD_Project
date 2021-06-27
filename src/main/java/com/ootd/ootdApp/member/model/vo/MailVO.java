package com.ootd.ootdApp.member.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailVO implements Serializable{
	
	private String from;
	private String to;
	private String subject;
	private String contents;
}
