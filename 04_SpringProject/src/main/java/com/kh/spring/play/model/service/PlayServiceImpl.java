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
	public List<Map<String, String>> selectPlayList(int cPage, int numPerPage) {
		
		return playDAO.selectPlayList(cPage, numPerPage);
	}

	@Override
	public int selectPlayTotalContents() {
		
		return playDAO.selectPlayTotalContents();
	}

	@Override
	public int insertPlay(Play play, List<Attachment> attachList) {
		
		int playResult = playDAO.insertPlay(play);
		
		// 첨부파일이 playNo를 알 수 있는 방법
		// 1. PlayDAO를 통해서 가장 최근에 추가된 게시글 번호 가져오기 ( O )
		// 2. mapper 파일을 통해서             ..  
		
		if( attachList.size() > 0) {
			// 첨부파일이 있을 때만 실행해라
			
			for(Attachment a : attachList) {
				int attachResult = playDAO.insertAttachment(a);
				if( attachResult == 0 ) throw new PlayException("첨부파일 전송 실패!");
			}
		}
				
		return playResult;
	}

	@Override
	public Play selectOnePlay(int playNo) {
		
		Play play = playDAO.selectOnePlay(playNo);
		
		if( play != null) playDAO.updateReadCount(playNo);
		
		return play;
	}

	/*
	 * @Override public List<Attachment> selectAttachmentList(int playNo) {
	 * 
	 * return playDAO.selectAttachmentList(playNo); }
	 */

	@Override
	public Play updateView(int playNo) {
		
		return playDAO.selectOnePlay(playNo);
	}

	@Override
	public int updatePlay(Play play) {
		
		int totalResult = 0;
		
		/*
		 * List<Attachment> originList =
		 * playDAO.selectAttachmentList(play.getPlayNo());
		 */
		
		totalResult = playDAO.updatePlay(play);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new PlayException("게시글 수정 실패!");
		
		/*
		 * if( originList.size() > 0) { // 기존 첨부파일이 DB에 있다면 totalResult =
		 * playDAO.deleteAttachment(play.getPlayNo());
		 * 
		 * if(totalResult == 0) throw new PlayException("첨부파일 삭제 실패!"); }
		 */
		
		/*
		 * if( attachList.size() > 0) { for(Attachment a : attachList) { totalResult =
		 * playDAO.updateAttachment(a);
		 * 
		 * if(totalResult == 0) throw new PlayException("게시글 첨부파일 수정 실패!"); } }
		 */
		
		return totalResult;
	}

	@Override
	public int deletePlay(int playNo) {
		
		return playDAO.deletePlay(playNo);
	}

	/*
	 * @Override public int deleteFile(int attNo) {
	 * 
	 * return playDAO.deleteFile(attNo); }
	 */

}
