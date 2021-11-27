package com.kh.spring.wish.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class WishList {
	private int wishId;
	private int wishUserNo;
	private String userId;
	private String wishArtId;
	private int artNo;
	private String artImg;
	private String artTitle;
	private String artGenre;
	private String artArea;
		
}


