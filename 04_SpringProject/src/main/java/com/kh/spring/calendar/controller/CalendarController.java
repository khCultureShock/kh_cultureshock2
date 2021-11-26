package com.kh.spring.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.calendar.model.service.CalendarService;
import com.kh.spring.calendar.model.vo.Calendar;


@Controller

public class CalendarController {
	
	@Autowired
	CalendarService calendarService;

	/*
	@RequestMapping("/calendar/calendar.do")
	public String calendar() {
		
		return "calendar/calendar";
	}
	*/
	
	@RequestMapping("/calendar/selectCalendarList.do")
	public String selectCalendarList(Model model) {
		
		List<Calendar> list = calendarService.selectCalendarList();
		
		System.out.println("CalendarList : " + list);
		
		model.addAttribute("list", list);
		
		return "calendar/calendar";
	}
	
}
