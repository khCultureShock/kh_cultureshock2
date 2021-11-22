package com.kh.spring.play.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.play.model.vo.Play;

public interface PlayService {
	
	List<Map<String, String>> selectPlayList(int cPage, int numPerPage);

	int selectPlayTotalContents();

	int insertPlay(Play play, List<Attachment> attachList);

	Play selectOnePlay(int playNo);

	/* List<Attachment> selectAttachmentList(int playNo); */

	Play updateView(int playNo);
	
	int updatePlay(Play play);
	
	int deletePlay(int playNo);

	/* int deleteFile(int attNo); */
	
}
