package com.kh.spring.calendar.model.service;

import java.util.List;

import com.kh.spring.calendar.model.vo.Calendar;

public interface CalendarService {

	List<Calendar> selectCalendarList();
}
