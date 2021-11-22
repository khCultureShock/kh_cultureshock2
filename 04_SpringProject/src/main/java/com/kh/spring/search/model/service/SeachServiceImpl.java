package com.kh.spring.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.dao.BoardDAO;
import com.kh.spring.search.model.dao.SearchDAO;

@Service
public class SeachServiceImpl implements SearchService {

	@Autowired
	SearchDAO searchDAO;
	
	@Override
	public List<Art> selectSearchList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		System.out.println("Service selectSearchList : " + cPage);
		System.out.println("Service selectSearchList : " + numPerPage);
		
		return searchDAO.selectSearchList(cPage, numPerPage);
	}

	@Override
	public int selectSearchTotalContents() {
		// TODO Auto-generated method stub
		return searchDAO.selectSearchTotalContents();
	}

	@Override
	public List<Art> searchInfo(int cPage, int numPerPage, String text) {
		// TODO Auto-generated method stub
		System.out.println("Service searchInfo : " + cPage);
		System.out.println("Service searchInfo : " + numPerPage);
		System.out.println("Service searchInfo : " + text);
		
		return searchDAO.searchInfo(cPage,numPerPage,text);
	}

	@Override
	public int searchInfototal(String text) {
		// TODO Auto-generated method stub
		System.out.println("Service searchInfototal : " + text);
		return searchDAO.searchInfototal(text);
	}

}
