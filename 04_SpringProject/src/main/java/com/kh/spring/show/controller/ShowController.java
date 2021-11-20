package com.kh.spring.show.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.spring.show.model.service.ShowService;
import com.kh.spring.show.model.vo.Show;

@Controller
public class ShowController {

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
	ShowService showService;
	
	@RequestMapping("/show/show.do")
	public void AjaxApi(HttpServletResponse response) throws IOException {
		
		  //최대 페이지
		
		  int maxpage = 10;
		  
		  List<Show> show = showService.selectList(maxpage);
		  
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		 
		  new Gson().toJson(show, response.getWriter());
		  
		  System.out.println(show);
		  
		 
	}
	
	@RequestMapping("/show/showView.do")
	public String showView(HttpServletResponse response) throws IOException {
		  
		  return "show/showView";
		  
		 
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
	

