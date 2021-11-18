package com.kh.spring.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.notice.model.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override							
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("noticeSQL.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return sqlSession.selectOne("noticeSQL.selectNoticeTotalContents");
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return sqlSession.insert("noticeSQL.insertNotice", notice);
	}

	@Override
	public int insertAttachment(Attachment a) {
		
		// return sqlSession.insert("noticeSQL.insertAttachment", a);
		return 0;
	}

	@Override
	public Notice selectOneNotice(int noticeNo) {
		
		return sqlSession.selectOne("noticeSQL.selectOneNotice", noticeNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int noticeNo) {

		return sqlSession.selectList("noticeSQL.selectAttachmentList", noticeNo);
	}

	@Override
	public int updateReadCount(int noticeNo) {
		
		return sqlSession.update("noticeSQL.updateReadCount", noticeNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		
		return sqlSession.update("noticeSQL.updateNotice", notice); // notice-mapper.xml 찾아가서 SQL 작성하기
	}

	@Override
	public int updateAttachment(Attachment a) {
		
		return sqlSession.insert("noticeSQL.updateAttachment", a);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		
		return sqlSession.delete("noticeSQL.deleteNotice", noticeNo);
	}

	@Override
	public int deleteAttachment(int noticeNo) {
		
		return sqlSession.delete("noticeSQL.deleteAttachment", noticeNo);
	}

	@Override
	public int deleteFile(int attNo) {
		
		return sqlSession.delete("noticeSQL.deleteFile", attNo);
	}

}
