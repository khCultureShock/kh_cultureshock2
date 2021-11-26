package com.kh.spring.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.notice.model.vo.Notice;

public interface NoticeDAO {

	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	int insertNotice(Notice notice);

	int insertAttachment(Attachment a);

	Notice selectOneNotice(int noticeNo);

	List<Attachment> selectAttachmentList(int noticeNo);
	
	int updateReadCount(int noticeNo);
	
	int updateNotice(Notice notice);

	int updateAttachment(Attachment a);

	int deleteNotice(int noticeNo);

	int deleteAttachment(int noticeNo);

	int deleteFile(int attNo);
}
