package com.kh.spring.play.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.play.model.vo.Play;

@Repository
public class PlayDAOImpl implements PlayDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override							
	public List<Map<String, String>> selectPlayList(int cPage, int numPerPage) {
		// 데이터베이스에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("playSQL.selectPlayList", null, rows);
	}

	@Override
	public int selectPlayTotalContents() {
		
		return sqlSession.selectOne("playSQL.selectPlayTotalContents");
	}

	@Override
	public int insertPlay(Play play) {
		
		return sqlSession.insert("playSQL.insertPlay", play);
	}

	@Override
	public int insertAttachment(Attachment a) {
		
		// return sqlSession.insert("playSQL.insertAttachment", a);
		return 0;
	}

	@Override
	public Play selectOnePlay(int playNo) {
		
		return sqlSession.selectOne("playSQL.selectOnePlay", playNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int playNo) {

		return sqlSession.selectList("playSQL.selectAttachmentList", playNo);
	}

	@Override
	public int updateReadCount(int playNo) {
		
		return sqlSession.update("playSQL.updateReadCount", playNo);
	}

	@Override
	public int updatePlay(Play play) {
		
		return sqlSession.update("playSQL.updatePlay", play); // play-mapper.xml 찾아가서 SQL 작성하기
	}

	@Override
	public int updateAttachment(Attachment a) {
		
		return sqlSession.insert("playSQL.updateAttachment", a);
	}

	@Override
	public int deletePlay(int playNo) {
		
		return sqlSession.delete("playSQL.deletePlay", playNo);
	}

	@Override
	public int deleteAttachment(int playNo) {
		
		return sqlSession.delete("playSQL.deleteAttachment", playNo);
	}

	@Override
	public int deleteFile(int attNo) {
		
		return sqlSession.delete("playSQL.deleteFile", attNo);
	}

}
