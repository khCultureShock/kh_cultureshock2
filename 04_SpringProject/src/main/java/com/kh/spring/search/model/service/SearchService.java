package com.kh.spring.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface SearchService {

	List<Art> selectSearchList(int cPage, int numPerPage);

	int selectSearchTotalContents();

	List<Art> searchInfo(int cPage, int numPerPage, String text);

	int searchInfototal(String text);

/*	int insertBoard(Board board, List<Attachment> attachList);

	Board selectOneBoard(int boardNo);

	List<Attachment> selectAttachmentList(int boardNo);

	Board updateView(int boardNo);
	
	int updateBoard(Board board, List<Attachment> attachList);
	
	int deleteBoard(int boardNo);

	int deleteFile(int attNo);
*/
}
