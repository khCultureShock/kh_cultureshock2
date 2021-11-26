package com.kh.spring.calendar.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Calendar {

	private int id;
	private String groupid;
	private String title;
	private String writer;
	private String content;
	private String start1;
	private String end1;
	private boolean allday;
	private String textcolor;
	private String backgroundcolor;
	private String bordercolor;
}
