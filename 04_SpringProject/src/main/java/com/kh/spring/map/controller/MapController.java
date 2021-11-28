package com.kh.spring.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.spring.art.model.vo.Art;
import com.kh.spring.common.Utils;
import com.kh.spring.common.UtilsMap;
import com.kh.spring.map.model.service.MapService;
import com.kh.spring.member.model.vo.Member;

@Controller
public class MapController {
	
	@Autowired
	MapService mapService;
	
	
	// 공공 데이터를 xml 파싱 시 무조건 선언 해야 함
		private static String getTagValue(String tag, Element eElement) {

			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

			Node nValue = (Node) nlList.item(0);
			if (nValue == null)
				return null;
			return nValue.getNodeValue();
		}
	
		@RequestMapping("/map/mapView.do") 
		public String mapView() {
			System.out.println("지도 접근 확인!");
			return "map/mapView";
		}
		
		
		
	@RequestMapping("/map/mapViewData.do")
	@ResponseBody
	public Map<String, List> mapViewData() {		

		boolean check = true;
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		List<String> list4 = new ArrayList<String>();
		List<String> list5 = new ArrayList<String>();
		List<String> list6 = new ArrayList<String>();
		List<String> listPlc = new ArrayList<String>();
		List<String> listX = new ArrayList<String>();
		List<String> listY = new ArrayList<String>();
		
		
		
		Map<String, List> map = new HashMap<String, List>();

		try {
			
			while (check) {
				String url = "https://www.kopis.or.kr/openApi/restful/pblprfr"
						   + "?service=4f13ee3dcf1b4ad48ab21532e0f5bdd1&stdate=20211201&eddate=20211231&cpage=1&rows=70&kidstate=Y";
				// 포스터, 공연명, 공연장소, 공연 번호
				
				// UTF-8로 인코딩된 xml문서 파싱		
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url); 
			

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");
				
				
				System.out.println("파싱할 리스트 수 : " + nList.getLength());
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					
					
					if (nNode.getNodeType() == Node.ELEMENT_NODE ) {

						Element eElement = (Element) nNode;

						list1.add(getTagValue("prfnm", eElement));
						list2.add(getTagValue("poster", eElement));
						list3.add(getTagValue("mt20id", eElement)); // 공연 ID
						list4.add(getTagValue("fcltynm", eElement));
						list5.add(getTagValue("prfpdfrom", eElement)); //시작 날짜
						list6.add(getTagValue("prfpdfrom", eElement)); // 종료 날짜
						
						
					}

				}

				if (list1.size() > 10) {
					check = false;
				}

			} // while문 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//************************************************************************
		// 공연 시설 id 뽑아오기
		
		try {
			for(int i = 0; i < list3.size(); i++) {
				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/"+list3.get(i)
						   +"?service=4f13ee3dcf1b4ad48ab21532e0f5bdd1";
				
						
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url); 
			

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");
				
				
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					
					
					if (nNode.getNodeType() == Node.ELEMENT_NODE ) {

						Element eElement = (Element) nNode;

						listPlc.add(getTagValue("mt10id", eElement));
					}

				}

				if (listPlc.size() > 10) {
					check = false;
				}

			} // for문 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//************************************************************************
		// 위도 경도 뽑아오기
		
		try {
			for(int i = 0; i < list3.size(); i++) {
				String url = "https://www.kopis.or.kr/openApi/restful/prfplc/"+ listPlc.get(i) +"?service=4f13ee3dcf1b4ad48ab21532e0f5bdd1&cpage=1&rows=10";
				
						
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url); 
			

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");
				
				
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					
					
					if (nNode.getNodeType() == Node.ELEMENT_NODE ) {

						Element eElement = (Element) nNode;

						listX.add(getTagValue("lo", eElement));
						listY.add(getTagValue("la", eElement));
					}

				}

				if (listX.size() > 10) {
					check = false;
				}

			} // for문 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//************************************************************************
		map.put("title", list1);
		map.put("poster", list2);
		map.put("pnum", list3);
		map.put("pname", list4); 
		map.put("startdate", list5);
		map.put("enddate", list6);
		map.put("pCode", listPlc); // 공연 시설 id
		map.put("gpsX", listX);
		map.put("gpsY", listY);
		
		System.out.println(map);	
	return map;
	}
	
	
	
	
	@RequestMapping("/map/mapPlcSrch.do")
	public String mapSrchInfo(Model model, @RequestParam(required = false) String pname,
										  @RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		int numPerPage = 12;
		List<Art>alist= mapService.searchInfo(cPage,numPerPage,pname);
		int totalContents = mapService.searchInfototal(pname);
		String pageBar = UtilsMap.getPageBar(totalContents, cPage, numPerPage, "mapPlcSrch.do",pname);
		
		model.addAttribute("alist",alist);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("pageBar",pageBar);
		
		
		System.out.println("searchInfo model : " + model);
		
		return "search/searchList";
		
	}
	
	
	
	@RequestMapping("/map/mapSelectList.do")
	public String mapSelectList(HttpServletRequest req,Model model, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage
			) {
			
			Member m = (Member)req.getSession().getAttribute("member");
		
			// 한 페이지당 게시글 수
			int numPerPage = 10;
			
			// 현재 페이지의 게시글 수
			List<Art> artList = mapService.selectSearchList(cPage, numPerPage);
			
			// 전체 게시글 수
			int totalContents = mapService.selectSearchTotalContents();			
			
			// 페이지 처리 Utils 사용하기
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "mapSelectList.do");
			
			List list = new ArrayList();
			
			for (Art art : artList) {
				
				list.add(art.getArtPlace());
			}
			
			System.out.println("list : " + list);
			System.out.println("pageBar : " + pageBar);
			
			
			model.addAttribute("list", list);
			model.addAttribute("artList", artList);
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);
			
			return "search/searchList";
		}
		
	
	
}
