package com.kh.spring.art.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.play.model.vo.Play;

@Repository
public class ArtDAOImpl implements ArtDAO {

	@Autowired
	SqlSessionTemplate sqlSession; 
	
	@Override
	public List<Art> selectList(int maxpage) {
		
		System.out.println("DAOMaxPage : " + maxpage);
		
		return sqlSession.selectList("artSQL.selectList", maxpage);
	}

	@Override							
	public List<Map<String, String>> selectArtList(int cPage, int numPerPage) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("artSQL.selectArtList", null, rows);
	}

	@Override
	public int selectArtTotalContents() {
		
		return sqlSession.selectOne("artSQL.selectArtTotalContents");
	}



	@Override
	public Art selectOneArt(int artNo) {
		
		return sqlSession.selectOne("artSQL.selectOneArt", artNo);
	}


}
