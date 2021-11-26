package com.kh.spring.detail.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.Utils;
import com.kh.spring.common.UtilsSearch;
import com.kh.spring.detail.model.service.DetailService;
import com.kh.spring.search.model.service.SearchService;


@Controller
public class DetailController {

	@Autowired
	DetailService detailService;
	
	@RequestMapping("/detail/detail.do")
		public String selectDetailOne(Model model, @RequestParam String artId) {
			
				 System.out.println("artId = " + artId);
					 								
				 Art art = detailService.selectArtOne(artId);
															
					model.addAttribute("art", art);

				return "play/playView";
	}
	
}


