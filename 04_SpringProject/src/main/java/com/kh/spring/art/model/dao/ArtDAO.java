package com.kh.spring.art.model.dao;

import java.util.List;

import com.kh.spring.art.model.vo.Art;

public interface ArtDAO {

	List<Art> selectList(int maxpage);

}
