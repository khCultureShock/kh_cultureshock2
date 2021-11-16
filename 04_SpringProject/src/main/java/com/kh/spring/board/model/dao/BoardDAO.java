package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface BoardDAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board);

	int insertAttachment(Attachment a);

	Board selectOneBoard(int boardNo);

	List<Attachment> selectAttachmentList(int boardNo);
	
	int updateReadCount(int boardNo);
	
	int updateBoard(Board board);

	int updateAttachment(Attachment a);

	int deleteBoard(int boardNo);

	int deleteAttachment(int boardNo);

	int deleteFile(int attNo);
}
