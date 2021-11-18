package com.kh.spring.art.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;

@Repository
public class ArtDAOImpl implements ArtDAO {

	@Autowired
	SqlSessionTemplate sqlSession; 
	
	@Override
	public List<Art> selectList(int maxpage) {
		
		System.out.println("DAOMaxPage : " + maxpage);
		
		return sqlSession.selectList("art.selectList", maxpage);
	}

}
