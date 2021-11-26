package com.kh.spring.calendar.model.dao;

import java.util.List;

import com.kh.spring.calendar.model.vo.Calendar;

public interface CalendarDAO {

	List<Calendar> selectCalendarList();
}
