package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface BoardService {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board, List<Attachment> attachList);

	Board selectOneBoard(int boardNo);

	List<Attachment> selectAttachmentList(int boardNo);

	Board updateView(int boardNo);
	
	int updateBoard(Board board, List<Attachment> attachList);
	
	int deleteBoard(int boardNo);

	int deleteFile(int attNo);
	
}
