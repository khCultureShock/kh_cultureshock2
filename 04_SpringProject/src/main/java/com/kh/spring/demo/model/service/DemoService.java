package com.kh.spring.demo.model.service;

import java.util.List;

import com.kh.spring.demo.model.vo.Dev;

public interface DemoService {
	/*
	 * Demo 서비스의 기능들을 명시하여, 
	 * 개발자들이 반드시 해당 메소드들을 구현하도록
	 * 강제하는 인터페이스 ( 개발의 가이드 )
	 */	
	/**
	 * 개발자 정보 추가를 위한 메소드
	 * @param dev
	 * @return
	 */
	int insertDev(Dev dev);
	
	/**
	 * 등록된 개발자 목록을 조회하는 메소드
	 * @return
	 */
	List<Dev> selectDevList();
	
	/**
	 * 등록번호를 기준으로 개발자 정보를 조회하는 메소드
	 * @param no
	 * @return
	 */
	Dev selectDev(int no);
	
	/**
	 * 개발자 정보를 수정하는 메소드
	 * @param dev
	 * @return
	 */
	int updateDev(Dev dev);
	
	/**
	 * 등록번호를 기준으로 개발자 정보를 삭제하는 메소드
	 * @param no
	 * @return
	 */
	int deleteDev(int no);
	
}
