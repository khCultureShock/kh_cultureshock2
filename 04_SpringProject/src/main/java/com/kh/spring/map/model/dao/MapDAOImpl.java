package com.kh.spring.map.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;

@Repository
public class MapDAOImpl implements MapDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Art> searchInfo(int cPage, int numPerPage, String pname) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);

		return sqlSession.selectList("mapSQL.searchInfo", pname, rows);
		
	}

	@Override
	public int searchInfototal(String pname) {
		
		return sqlSession.selectOne("mapSQL.searchInfototal", pname);
	}

	@Override
	public int selectSearchTotalContents() {
		
		return sqlSession.selectOne("mapSQL.selectSearchTotalContents");
	}

	@Override
	public List<Art> selectSearchList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("mapSQL.selectSearchList",null,rows);
	}

}
