package com.kh.spring.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member member) {
		
		return memberDAO.insertMember(member);
	}
	
	@Override
	public Member selectOneMember(String userId) {
		
		return memberDAO.selectOneMember(userId);
	}

	@Override
	public int updateMember(Member member) {
		
		return memberDAO.updateMember(member);
	}

	@Override
	public int deleteMember(String userId) {
		
		return memberDAO.deleteMember(userId);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		// 1. 일반 데이터 전달 시
		// return memberDAO.checkIdDuplicate(userId);
		
		// 2. 맵 데이터 전달 시 (callable 활용 방식)
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}

	@Override
	public Member idFind(String phone) {
		
		return memberDAO.idFind(phone);
	}

	@Override
	public int changePw(Member member) {
	
		
		return memberDAO.changePw(member);
	}

	
	
	
	

}
