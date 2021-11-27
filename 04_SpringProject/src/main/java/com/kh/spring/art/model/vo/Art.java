package com.kh.spring.art.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class Art {
	
	private int artNo;
	private String artId;
	private String artTitle;
	private Date startDate;
	private Date endDate;
	private String artPlace;
	private String artImg;
	private String artGenre;
	private String artStatus;
	private char artOpenrun;
	private String artArea;
	private int artPrice;
	private String artText;
}
