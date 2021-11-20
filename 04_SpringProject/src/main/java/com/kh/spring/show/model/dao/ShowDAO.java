package com.kh.spring.show.model.dao;

import java.util.List;

import com.kh.spring.show.model.vo.Show;

public interface ShowDAO {

	List<Show> selectList(int maxpage);

}
