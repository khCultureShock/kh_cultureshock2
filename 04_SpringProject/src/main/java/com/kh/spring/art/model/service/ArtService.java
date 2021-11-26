package com.kh.spring.art.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;

public interface ArtService {

	List<Art> selectList(int maxpage);

	List<Map<String, String>> selectArtList(int cPage, int numPerPage);

	Art selectOneArt(int no);

	int selectArtTotalContents();

}
