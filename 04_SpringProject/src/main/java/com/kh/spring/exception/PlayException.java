package com.kh.spring.exception;

public class PlayException extends RuntimeException {
	public PlayException() { }
	
	public PlayException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
