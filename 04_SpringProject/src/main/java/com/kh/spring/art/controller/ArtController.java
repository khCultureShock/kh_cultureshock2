package com.kh.spring.art.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import com.kh.spring.art.model.service.ArtService;
import com.kh.spring.art.model.vo.Art;

@Controller
public class ArtController {

	/*
	 * // 공공 데이터를 xml 파싱 시 무조건 선언 해야 함 private static String getTagValue(String tag,
	 * Element eElement) {
	 * 
	 * NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	 * 
	 * Node nValue = (Node) nlList.item(0); if (nValue == null) return null; return
	 * nValue.getNodeValue(); }
	 */
	
	@Autowired
	ArtService artService;
	
	@RequestMapping("/art/art.do")
	public void AjaxApi(HttpServletResponse response) throws IOException {
		
		  //최대 페이지
		
		  int maxpage = 4;
		  
		  List<Art> art = artService.selectList(maxpage);
		  
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		 
		  new Gson().toJson(art, response.getWriter());
		  
		  System.out.println(art);
		 
	}
}

/*
 * int maxpage = 9;
 * 
 * List<Art> art = artService.selectList(maxpage);
 * 
 * List<Art> list = new ArrayList<Art>(); list = artService.selectList(maxpage);
 * 
 * List<String> list1 = new ArrayList<String>(); Map<String, List> map = new
 * HashMap<String, List>();
 * 
 * for(Art i : list) { try { String url =
 * "http://www.kopis.or.kr/openApi/restful/pblprfr/" + i.getArtno() +
 * "?service=38a656eee50b4749851426fef929e0cd";
 * 
 * DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
 * DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder(); Document doc =
 * dBuilder.parse(url);
 * 
 * doc.getDocumentElement().normalize();
 * 
 * NodeList nList = doc.getElementsByTagName("db");
 * 
 * for (int temp = 0; temp < nList.getLength(); temp++) { Node nNode =
 * nList.item(temp); if (nNode.getNodeType() == Node.ELEMENT_NODE) {
 * 
 * Element eElement = (Element) nNode;
 * 
 * 
 * list1.add(getTagValue("artimg", eElement));
 * 
 * } } } catch (Exception e) { e.printStackTrace(); } } map.put("artimg",
 * list1);
 * 
 * System.out.println("map : " + map);
 * 
 * return map; }
 */	
	

