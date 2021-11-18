package com.kh.spring.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;



@Controller
public class MapController {
	// 서비스 autowired 해주기

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

		// 위도 경도 api url
		/*
		 * "https://www.kopis.or.kr/openApi/restful/pblprfr?service=4f13ee3dcf1b4ad48ab21532e0f5bdd1&stdate=20211201&eddate=20211231&cpage=1&rows=1000&kidstate=Y"
		 */
		
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		List<String> list4 = new ArrayList<String>();
		Map<String, List> map = new HashMap<String, List>();

		try {
			
			while (true) {
				String url = "https://www.kopis.or.kr/openApi/restful/pblprfr"
						+ "?service=4f13ee3dcf1b4ad48ab21532e0f5bdd1&stdate=20211201&eddate=20211231&cpage=1&rows=10&kidstate=Y";

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");
				System.out.println("파싱할 리스트 수 : " + nList.getLength());
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;

						list1.add(getTagValue("prfnm", eElement));
						list2.add(getTagValue("poster", eElement));
						list3.add(getTagValue("mt20id", eElement));
						list4.add(getTagValue("fcltynm", eElement));

					}

				}

				if (list1.size() > 10) {
					break;
				}

			} // while문 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
			
		map.put("title", list1);
		map.put("poster", list2);
		map.put("pnum", list3);
		map.put("plcName", list4);

		System.out.println(map);
		return map;

	}

}
