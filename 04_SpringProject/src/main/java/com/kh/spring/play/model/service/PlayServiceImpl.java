package com.kh.spring.play.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.exception.PlayException;
import com.kh.spring.play.model.dao.PlayDAO;
import com.kh.spring.play.model.vo.Play;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDAO playDAO;
		
	@Override
	public List<Map<String, String>> selectPlayList(int cPage, int numPerPage,String artArea) {
		
		return playDAO.selectPlayList(cPage, numPerPage,artArea);
	}

	@Override
	public int selectPlayTotalContents(String artArea) {
		
		return playDAO.selectPlayTotalContents(artArea);
	}


	@Override
	public Play selectOnePlay(int playNo) {
		
		Play play = playDAO.selectOnePlay(playNo);
		
		return play;
	}

}
