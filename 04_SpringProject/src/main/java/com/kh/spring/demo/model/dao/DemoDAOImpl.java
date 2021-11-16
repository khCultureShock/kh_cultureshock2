package com.kh.spring.demo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.demo.model.vo.Dev;

@Repository
public class DemoDAOImpl implements DemoDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertDev(Dev dev) {
		
		return sqlSession.insert("devSQL.insertDev", dev);
	}

	@Override
	public List<Dev> selectDevList() {
		
		return sqlSession.selectList("devSQL.selectDevList");
	}

	@Override
	public Dev selectDev(int no) { // DAO입니다!
		
		return sqlSession.selectOne("devSQL.selectDev", no);
	}

	@Override
	public int updateDev(Dev dev) {
		
		return sqlSession.update("devSQL.updateDev", dev);
	}

	@Override
	public int deleteDev(int no) {
		
		return sqlSession.delete("devSQL.deleteDev", no);
	}

}
