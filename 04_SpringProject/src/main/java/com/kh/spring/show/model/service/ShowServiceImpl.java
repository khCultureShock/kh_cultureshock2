package com.kh.spring.show.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.show.model.dao.ShowDAO;
import com.kh.spring.show.model.vo.Show;

@Service
public class ShowServiceImpl implements ShowService {

	@Autowired
	ShowDAO showDAO;
	
	@Override
	public List<Show> selectList(int maxpage) {
	
		
		System.out.println("ServiceMaxPage : " + maxpage);
		
		return showDAO.selectList(maxpage);
	}

}
