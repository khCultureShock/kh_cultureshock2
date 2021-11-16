package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.BoardDAO;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.exception.BoardException;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
		
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		return boardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return boardDAO.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(Board board, List<Attachment> attachList) {
		
		int boardResult = boardDAO.insertBoard(board);
		
		// 첨부파일이 boardNo를 알 수 있는 방법
		// 1. BoardDAO를 통해서 가장 최근에 추가된 게시글 번호 가져오기 ( O )
		// 2. mapper 파일을 통해서             ..  
		
		if( attachList.size() > 0) {
			// 첨부파일이 있을 때만 실행해라
			
			for(Attachment a : attachList) {
				int attachResult = boardDAO.insertAttachment(a);
				if( attachResult == 0 ) throw new BoardException("첨부파일 전송 실패!");
			}
		}
				
		return boardResult;
	}

	@Override
	public Board selectOneBoard(int boardNo) {
		
		Board board = boardDAO.selectOneBoard(boardNo);
		
		if( board != null) boardDAO.updateReadCount(boardNo);
		
		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		
		return boardDAO.selectAttachmentList(boardNo);
	}

	@Override
	public Board updateView(int boardNo) {
		
		return boardDAO.selectOneBoard(boardNo);
	}

	@Override
	public int updateBoard(Board board, List<Attachment> attachList) {
		
		int totalResult = 0;
		
		List<Attachment> originList = boardDAO.selectAttachmentList(board.getBoardNo());
		
		totalResult = boardDAO.updateBoard(board);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new BoardException("게시글 수정 실패!");
		
		if( originList.size() > 0) { 
			// 기존 첨부파일이 DB에 있다면
			totalResult = boardDAO.deleteAttachment(board.getBoardNo());
			
			if(totalResult == 0) throw new BoardException("첨부파일 삭제 실패!");
		}
		
		if( attachList.size() > 0) {
			for(Attachment a : attachList) {
				totalResult = boardDAO.updateAttachment(a);
				
				if(totalResult == 0) throw new BoardException("게시글 첨부파일 수정 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteBoard(int boardNo) {
		
		return boardDAO.deleteBoard(boardNo);
	}

	@Override
	public int deleteFile(int attNo) {
		
		return boardDAO.deleteFile(attNo);
	}

}
