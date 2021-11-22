package com.kh.spring.category.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;

public interface CategoryDAO {

	int selectCateTotalContents(String artGenre);
	List<Art> selectCateList(int cPage, int numPerPage, String artGenre);
	List<Art> cateInfo(int cPage, int numPerPage, String text);
	int cateInfototal(String text);
	
	// List<Map<String, String>> selectSearchList(int cPage, int numPerPage);


}
