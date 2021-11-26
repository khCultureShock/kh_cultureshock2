package com.kh.spring.show.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class Show {

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
}
