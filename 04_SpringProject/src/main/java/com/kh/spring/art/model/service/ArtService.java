package com.kh.spring.art.model.service;

import java.util.List;

import com.kh.spring.art.model.vo.Art;

public interface ArtService {

	List<Art> selectList(int maxpage);

}
