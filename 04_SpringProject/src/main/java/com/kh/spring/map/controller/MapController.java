package com.kh.spring.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	@RequestMapping("/map/mapView.do")
	public String mapView() {
		System.out.println("지도 접근 확인!");
		
		return "map/mapView";
	}

}
