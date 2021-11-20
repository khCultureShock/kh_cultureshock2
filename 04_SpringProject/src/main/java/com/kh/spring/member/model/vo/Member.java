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
	private String gender;
	private Integer age;	
	private String phone;
	private String email;
	private int userStatus;
	private Date joinDate;

	public Member(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}
}
