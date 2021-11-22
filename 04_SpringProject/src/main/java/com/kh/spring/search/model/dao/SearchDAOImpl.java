package com.kh.spring.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectSearchTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("searchSQL.selectSearchTotalContents");
	}

	@Override
	public List<Art> selectSearchList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		
		return sqlSession.selectList("searchSQL.selectSearchList",null,rows);
	}

	@Override
	public List<Art> searchInfo(int cPage, int numPerPage, String text) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);

		return sqlSession.selectList("searchSQL.searchInfo", text, rows);
	}

	@Override
	public int searchInfototal(String text) {
		
		return sqlSession.selectOne("searchSQL.searchInfototal", text);
	}

}
