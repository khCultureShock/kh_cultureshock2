package com.kh.spring.search.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;

public interface SearchDAO {

	int selectSearchTotalContents();
	List<Art> selectSearchList(int cPage, int numPerPage);
	List<Art> searchInfo(int cPage, int numPerPage, String text);
	int searchInfototal(String text);
	
	// List<Map<String, String>> selectSearchList(int cPage, int numPerPage);


}
