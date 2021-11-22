package com.kh.spring.map.model.dao;

import java.util.List;

import com.kh.spring.art.model.vo.Art;

public interface MapDAO {
	
	int selectSearchTotalContents();
	
	List<Art> selectSearchList(int cPage, int numPerPage);
	
	List<Art> searchInfo(int cPage, int numPerPage, String pname);

	int searchInfototal(String pname);

}
