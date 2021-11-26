package com.kh.spring.play.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.play.model.vo.Play;

@Repository
public class PlayDAOImpl implements PlayDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override							
	public List<Map<String, String>> selectPlayList(int cPage, int numPerPage,String artArea) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("playSQL.selectPlayList", artArea, rows);
	}

	@Override
	public int selectPlayTotalContents(String artArea) {
		
		return sqlSession.selectOne("playSQL.selectPlayTotalContents",artArea);
	}


	@Override
	public Play selectOnePlay(int playNo) {
		
		return sqlSession.selectOne("playSQL.selectOnePlay", playNo);
	}
}
