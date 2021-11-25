package com.kh.spring.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberSQL.insertMember", member);
	}
	

	@Override
	public Member selectOneMember(String userId) {
		
		return sqlSession.selectOne("memberSQL.selectOne", userId);
	}

	@Override
	public int updateMember(Member member) {
		
		return sqlSession.update("memberSQL.updateMember", member);
	}

	@Override
	public int deleteMember(String userId) {
		
		return sqlSession.delete("memberSQL.deleteMember", userId);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {

		sqlSession.selectOne("memberSQL.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public int checkIdDuplicate(String userId) {
		return sqlSession.selectOne("memberSQL.checkIdDuplicate", userId);
	}

	@Override
	public Member idFind(String phone) {
		
		return sqlSession.selectOne("memberSQL.idFind",phone);
	}

	@Override
	public int changePw(Member member) {
		
		return sqlSession.update("memberSQL.changePw",member);
		
	}

	

}
