package com.kh.spring.play.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.play.model.vo.Play;

public interface PlayDAO {

	List<Map<String, String>> selectPlayList(int cPage, int numPerPage);

	int selectPlayTotalContents();

	int insertPlay(Play play);

	int insertAttachment(Attachment a);

	Play selectOnePlay(int playNo);

	List<Attachment> selectAttachmentList(int playNo);
	
	int updateReadCount(int playNo);
	
	int updatePlay(Play play);

	int updateAttachment(Attachment a);

	int deletePlay(int playNo);

	int deleteAttachment(int playNo);

	int deleteFile(int attNo);
}
