package com.kh.spring.detail.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;

@Repository
public class DetailDAOImpl implements DetailDAO {

	@Autowired
	SqlSessionTemplate sqlSession; 
	
	@Override
	public Art selectArtOne(String artId) {
		
		return sqlSession.selectOne("detailSQL.selectArtOne" ,artId);
	}

}
