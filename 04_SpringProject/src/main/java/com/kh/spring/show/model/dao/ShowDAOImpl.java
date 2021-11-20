package com.kh.spring.show.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.show.model.vo.Show;

@Repository
public class ShowDAOImpl implements ShowDAO {

	@Autowired
	SqlSessionTemplate sqlSession; 
	
	@Override
	public List<Show> selectList(int maxpage) {
		
		System.out.println("DAOMaxPage : " + maxpage);
		
		return sqlSession.selectList("show.selectList", maxpage);
	}

}
