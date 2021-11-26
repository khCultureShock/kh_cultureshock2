package com.kh.spring.map.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface MapService {
	
//	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

//	int selectBoardTotalContents();
//  int insertBoard(Board board, List<Attachment> attachList);

//	Board selectOneBoard(int boardNo);

//	List<Attachment> selectAttachmentList(int boardNo);

//	Board updateView(int boardNo);
	List<Art> selectSearchList(int cPage, int numPerPage);

	int selectSearchTotalContents();

	List<Art> searchInfo(int cPage, int numPerPage, String pname);

	int searchInfototal(String pname);
	
//	int updateBoard(Board board, List<Attachment> attachList);

//	int deleteBoard(int boardNo);

//	int deleteFile(int attNo);
	
}
