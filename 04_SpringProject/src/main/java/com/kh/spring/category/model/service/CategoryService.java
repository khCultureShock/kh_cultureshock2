package com.kh.spring.category.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface CategoryService {

	List<Art> selectCateList(int cPage, int numPerPage, String artGenre);

	int selectCateTotalContents(String artGenre);

	List<Art> cateInfo(int cPage, int numPerPage, String text);

	int cateInfototal(String text);


}
