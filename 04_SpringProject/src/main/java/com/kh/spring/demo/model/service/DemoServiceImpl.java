package com.kh.spring.demo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.demo.model.dao.DemoDAO;
import com.kh.spring.demo.model.vo.Dev;

@Service
public class DemoServiceImpl implements DemoService {
	/* 
	 * 상속받은 인터페이스의 미구현 메소드들을 구현함으로써
	 * 본래의 목적을 완수시킬 수 있다.
	 */
	@Autowired
	DemoDAO demoDAO;
	
	@Override
	public int insertDev(Dev dev) {
		
		return demoDAO.insertDev(dev);
	}

	@Override
	public List<Dev> selectDevList() {
		
		return demoDAO.selectDevList();
	}

	@Override
	public Dev selectDev(int no) {  // 서비스입니다!
		
		return demoDAO.selectDev(no);
	}

	@Override
	public int updateDev(Dev dev) {
		
		return demoDAO.updateDev(dev);
	}

	@Override
	public int deleteDev(int no) {
		
		return demoDAO.deleteDev(no);
	}
}
