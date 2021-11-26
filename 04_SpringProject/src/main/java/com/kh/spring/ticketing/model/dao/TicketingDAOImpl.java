package com.kh.spring.ticketing.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.art.model.vo.Art;

@Repository
public class TicketingDAOImpl implements TicketingDAO {

	@Autowired
	SqlSessionTemplate sqlSesstion;
	
	@Override
	public Art selectArtOne(String artId) {
		// TODO Auto-generated method stub
		return sqlSesstion.selectOne("ticketingSQL.selectArtOne", artId);
	}

}
