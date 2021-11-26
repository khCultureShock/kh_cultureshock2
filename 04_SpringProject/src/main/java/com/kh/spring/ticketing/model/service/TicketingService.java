package com.kh.spring.ticketing.model.service;

import java.util.List;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.member.model.vo.Member;

public interface TicketingService {

	/* Member selectMember(Member m1); */

	Art selectArtOne(String artId);

}
