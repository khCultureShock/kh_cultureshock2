package com.kh.spring.detail.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.detail.model.dao.DetailDAO;


@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	DetailDAO detailDAO;
	
	@Override
	public Art selectArtOne(String artId) {
		
		return detailDAO.selectArtOne(artId);
	}

}
