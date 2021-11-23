package com.kh.spring.play.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.play.model.vo.Play;

public interface PlayService {
	
	List<Map<String, String>> selectPlayList(int cPage, int numPerPage,String artArea);

	int selectPlayTotalContents(String artArea);

	Play selectOnePlay(int playNo);
	
}
