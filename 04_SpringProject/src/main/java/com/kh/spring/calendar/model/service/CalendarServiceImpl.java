package com.kh.spring.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.model.dao.CalendarDAO;
import com.kh.spring.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDAO calendarDAO;
	
	@Override
	public List<Calendar> selectCalendarList() {
		
		return calendarDAO.selectCalendarList();
	}

}
