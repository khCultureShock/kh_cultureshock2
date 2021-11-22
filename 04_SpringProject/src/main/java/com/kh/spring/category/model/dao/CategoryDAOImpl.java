package com.kh.spring.category.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectCateTotalContents(String artGenre) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("categorySQL.selectCateTotalContents", artGenre);
	}

	@Override
	public List<Art> selectCateList(int cPage, int numPerPage, String artGenre) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		
		return sqlSession.selectList("categorySQL.selectCateList",artGenre,rows);
	}

	@Override
	public List<Art> cateInfo(int cPage, int numPerPage, String text) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);

		return sqlSession.selectList("categorySQL.cateInfo", text, rows);
	}

	@Override
	public int cateInfototal(String text) {
		
		return sqlSession.selectOne("categorySQL.cateInfototal", text);
	}

}
