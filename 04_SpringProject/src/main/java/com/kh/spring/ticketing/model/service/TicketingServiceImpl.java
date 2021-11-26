package com.kh.spring.ticketing.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.ticketing.model.dao.TicketingDAO;

@Service
public class TicketingServiceImpl implements TicketingService {

	@Autowired
	TicketingDAO ticketingDAO;
	
	/*
	 * @Override public Member selectMember(Member m1) {
	 * 
	 * return ticketingDAO.selectMember(m1); }
	 */

	@Override
	public Art selectArtOne(String artId) {
		// TODO Auto-generated method stub
		return ticketingDAO.selectArtOne(artId);
	}

}
