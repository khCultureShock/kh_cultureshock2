package com.kh.spring.play.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Play implements Serializable {
	
	private static final long serialVersionUID = 79337L;
	
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
	

}
