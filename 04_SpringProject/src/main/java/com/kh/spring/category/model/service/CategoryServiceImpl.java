package com.kh.spring.category.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.dao.BoardDAO;
import com.kh.spring.category.model.dao.CategoryDAO;
import com.kh.spring.search.model.dao.SearchDAO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDAO categoryDAO;
	
	@Override
	public List<Art> selectCateList(int cPage, int numPerPage, String artGenre) {
		// TODO Auto-generated method stub
		System.out.println("Service selectCateList : " + cPage);
		System.out.println("Service selectCateList : " + numPerPage);
		
		return categoryDAO.selectCateList(cPage, numPerPage, artGenre);
	}

	@Override
	public int selectCateTotalContents(String artGenre) {
		// TODO Auto-generated method stub
		return categoryDAO.selectCateTotalContents(artGenre);
	}

	@Override
	public List<Art> cateInfo(int cPage, int numPerPage, String text) {
		// TODO Auto-generated method stub
		System.out.println("Service cateInfo : " + cPage);
		System.out.println("Service cateInfo : " + numPerPage);
		System.out.println("Service cateInfo : " + text);
		
		return categoryDAO.cateInfo(cPage,numPerPage,text);
	}

	@Override
	public int cateInfototal(String text) {
		// TODO Auto-generated method stub
		System.out.println("Service cateInfototal : " + text);
		return categoryDAO.cateInfototal(text);
	}

}
