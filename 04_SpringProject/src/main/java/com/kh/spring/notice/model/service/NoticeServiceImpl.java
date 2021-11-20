package com.kh.spring.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.notice.model.dao.NoticeDAO;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.exception.NoticeException;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
		
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return noticeDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return noticeDAO.selectNoticeTotalContents();
	}

	@Override
	public int insertNotice(Notice notice, List<Attachment> attachList) {
		
		int noticeResult = noticeDAO.insertNotice(notice);
		
		// 첨부파일이 noticeNo를 알 수 있는 방법
		// 1. NoticeDAO를 통해서 가장 최근에 추가된 게시글 번호 가져오기 ( O )
		// 2. mapper 파일을 통해서             ..  
		
		if( attachList.size() > 0) {
			// 첨부파일이 있을 때만 실행해라
			
			for(Attachment a : attachList) {
				int attachResult = noticeDAO.insertAttachment(a);
				if( attachResult == 0 ) throw new NoticeException("첨부파일 전송 실패!");
			}
		}
				
		return noticeResult;
	}

	@Override
	public Notice selectOneNotice(int noticeNo) {
		
		Notice notice = noticeDAO.selectOneNotice(noticeNo);
		
		if( notice != null) noticeDAO.updateReadCount(noticeNo);
		
		return notice;
	}

	/*
	 * @Override public List<Attachment> selectAttachmentList(int noticeNo) {
	 * 
	 * return noticeDAO.selectAttachmentList(noticeNo); }
	 */

	@Override
	public Notice updateView(int noticeNo) {
		
		return noticeDAO.selectOneNotice(noticeNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		
		int totalResult = 0;
		
		/*
		 * List<Attachment> originList =
		 * noticeDAO.selectAttachmentList(notice.getNoticeNo());
		 */
		
		totalResult = noticeDAO.updateNotice(notice);  // DAO 로 이동하기
		
		if(totalResult == 0) throw new NoticeException("게시글 수정 실패!");
		
		/*
		 * if( originList.size() > 0) { // 기존 첨부파일이 DB에 있다면 totalResult =
		 * noticeDAO.deleteAttachment(notice.getNoticeNo());
		 * 
		 * if(totalResult == 0) throw new NoticeException("첨부파일 삭제 실패!"); }
		 */
		
		/*
		 * if( attachList.size() > 0) { for(Attachment a : attachList) { totalResult =
		 * noticeDAO.updateAttachment(a);
		 * 
		 * if(totalResult == 0) throw new NoticeException("게시글 첨부파일 수정 실패!"); } }
		 */
		
		return totalResult;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		
		return noticeDAO.deleteNotice(noticeNo);
	}

	/*
	 * @Override public int deleteFile(int attNo) {
	 * 
	 * return noticeDAO.deleteFile(attNo); }
	 */

}
