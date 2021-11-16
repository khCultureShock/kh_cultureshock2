package com.kh.spring.exception;

public class MemberException extends RuntimeException {

	public MemberException() { }
	
	public MemberException(String msg) {
		super("회원 ERROR :: " + msg);
		// super("회원 ERROR :: 계속 이 메시지가 반복된다면 관리자에게 문의하세요!");
	}
}
