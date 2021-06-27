package com.ootd.ootdApp.member.exception;

public class MemberException extends RuntimeException {
									// runtime 바꿔주기 
	public MemberException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberException(String message) {
		super("회원 ERROR :: " + message);
	}

}
