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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import com.kh.spring.art.model.service.ArtService;
import com.kh.spring.art.model.vo.Art;
import com.kh.spring.common.Utils;
import com.kh.spring.play.model.vo.Play;

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
	
	@RequestMapping("/art/artList.do")
	public String selectPlayList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,Model model
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = artService.selectArtList(cPage, numPerPage);
		
		// 전체 게시글 수
		int totalContents = artService.selectArtTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "artList.do");
		
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "play/playList";
	}
	
	@RequestMapping("/art/artView.do")
	public String artView(@RequestParam int no, Model model) {
		
		Art art = artService.selectOneArt(no);
		/* List<Attachment> attachmentList = noticeService.selectAttachmentList(no); */
		
		model.addAttribute("art", art);
		/* model.addAttribute("attachmentList", attachmentList); */
		
		return "play/playView";
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
	

