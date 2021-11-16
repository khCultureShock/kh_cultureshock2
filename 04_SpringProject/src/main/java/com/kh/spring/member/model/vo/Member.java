package com.kh.spring.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int userNo;
	private String userId;
	private String password;
	private String userName;	
	private Integer age;	
	private String email;
	private String phone;
	private Date enrollDate;
	private String gender;
	
	public Member(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}
}
