package com.kh.spring.map.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.map.model.dao.MapDAO;

@Service
public class MapServiceImpl implements MapService {
	@Autowired
	MapDAO mapDAO;

	@Override
	public List<Art> searchInfo(int cPage, int numPerPage, String pname) {
		// TODO Auto-generated method stub
				System.out.println("MapService searchInfo : " + cPage);
				System.out.println("MapService searchInfo : " + numPerPage);
				System.out.println("MapService searchInfo : " + pname);
				
				return mapDAO.searchInfo(cPage, numPerPage, pname);
		
	}

	@Override
	public int searchInfototal(String pname) {
		System.out.println("Service searchInfototal : " + pname);
		return mapDAO.searchInfototal(pname);
	}

	@Override
	public List<Art> selectSearchList(int cPage, int numPerPage) {
		
		return mapDAO.selectSearchList(cPage, numPerPage);
	}

	@Override
	public int selectSearchTotalContents() {
		// TODO Auto-generated method stub
		return mapDAO.selectSearchTotalContents();
	}

}
