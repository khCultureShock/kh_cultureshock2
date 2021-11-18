package com.kh.spring.art.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.dao.ArtDAO;
import com.kh.spring.art.model.vo.Art;

@Service
public class ArtServiceImpl implements ArtService {

	@Autowired
	ArtDAO artDAO;
	
	@Override
	public List<Art> selectList(int maxpage) {
	
		
		System.out.println("ServiceMaxPage : " + maxpage);
		
		return artDAO.selectList(maxpage);
	}

}
