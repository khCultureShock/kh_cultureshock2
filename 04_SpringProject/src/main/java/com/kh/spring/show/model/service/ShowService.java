package com.kh.spring.show.model.service;

import java.util.List;

import com.kh.spring.show.model.vo.Show;

public interface ShowService {

	List<Show> selectList(int maxpage);

}
