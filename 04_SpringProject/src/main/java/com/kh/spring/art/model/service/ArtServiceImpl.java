package com.kh.spring.art.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.art.model.dao.ArtDAO;
import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.exception.PlayException;
import com.kh.spring.play.model.vo.Play;

@Service
public class ArtServiceImpl implements ArtService {

	@Autowired
	ArtDAO artDAO;
	
	@Override
	public List<Art> selectList(int maxpage) {
	
		
		System.out.println("ServiceMaxPage : " + maxpage);
		
		return artDAO.selectList(maxpage);
	}
	
	@Override
	public List<Map<String, String>> selectArtList(int cPage, int numPerPage) {
		
		return artDAO.selectArtList(cPage, numPerPage);
	}



	@Override
	public Art selectOneArt(int artNo) {
		
		Art art = artDAO.selectOneArt(artNo);
		
	
		
		return art;
	}

	@Override
	public int selectArtTotalContents() {
		
		return artDAO.selectArtTotalContents();
	}

}
