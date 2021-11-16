package com.kh.spring.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Board implements Serializable {
	
	private static final long serialVersionUID = 79337L;
	
	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date boardDate;
	private int boardReadCount;
	
	private int fileCount; // 가상 컬럼에 대한 필드 추가!
	// ** 테이블과 VO의 필드는 반드시 1:1로 만들어질 필요 X
}
