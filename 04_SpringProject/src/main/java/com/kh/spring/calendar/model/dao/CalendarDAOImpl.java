package com.kh.spring.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.calendar.model.vo.Calendar;

@Repository
public class CalendarDAOImpl implements CalendarDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Calendar> selectCalendarList() {
		
		return sqlSession.selectList("calDAO.selectCalendarList");
	}

}
