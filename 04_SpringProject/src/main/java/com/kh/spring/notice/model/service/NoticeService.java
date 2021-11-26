package com.kh.spring.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.notice.model.vo.Notice;

public interface NoticeService {
	
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	int insertNotice(Notice notice, List<Attachment> attachList);

	Notice selectOneNotice(int noticeNo);

	/* List<Attachment> selectAttachmentList(int noticeNo); */

	Notice updateView(int noticeNo);
	
	int updateNotice(Notice notice);
	
	int deleteNotice(int noticeNo);

	/* int deleteFile(int attNo); */
	
}
