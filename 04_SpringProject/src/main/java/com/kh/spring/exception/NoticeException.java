package com.kh.spring.exception;

public class NoticeException extends RuntimeException {
	public NoticeException() { }
	
	public NoticeException(String msg) {
		super("[게시글 서비스] :" + msg);
	}
}
