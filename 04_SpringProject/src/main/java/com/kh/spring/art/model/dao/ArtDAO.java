package com.kh.spring.art.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.play.model.vo.Play;

public interface ArtDAO {

	List<Art> selectList(int maxpage);

	int selectArtTotalContents();

	List<Map<String, String>> selectArtList(int cPage, int numPerPage);

	Art selectOneArt(int artNo);


}
