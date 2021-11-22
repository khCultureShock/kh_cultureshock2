package com.kh.spring.category.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.art.model.vo.Art;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.category.model.service.CategoryService;
import com.kh.spring.common.Utils;
import com.kh.spring.common.UtilsSearch;
import com.kh.spring.search.model.service.SearchService;


@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/category/category.do")
		public String searchInfo(Model model, @RequestParam(required = false) String text,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
			
			int numPerPage = 12;
			List<Art>alist= categoryService.cateInfo(cPage,numPerPage,text);
			int totalContents = categoryService.cateInfototal(text);
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "playsr.do",text);
			
			model.addAttribute("alist",alist);
			model.addAttribute("numPerPage",numPerPage);
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("pageBar",pageBar);
			
			
			System.out.println("cateInfo model : " + model);
			
			return "category/cateList";
		
	}
	
	@RequestMapping("/category/cateList.do")
	public String selectSearchList(HttpServletRequest req, Model model, 
			                       @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			                       @RequestParam(value="artGenre", required=false, defaultValue="연극") String artGenre) {
		
		Member m = (Member)req.getSession().getAttribute("member");	
		
		// 한 페이지당 작품 수
		int numPerPage = 24;
		
		// 전체 작품 수
		int totalContents = categoryService.selectCateTotalContents(artGenre);
		
		System.out.println(totalContents);
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "cateList.do", artGenre);
		
		// 현재 페이지의 게시글 수
		List<Art> alist = categoryService.selectCateList(cPage, numPerPage, artGenre);
		
		int m1 = 0;
		if( m!=null) {
			m1 = m.getUserNo();
		}
		
		List list = new ArrayList();
		
		for (Art a : alist) {
			
			list.add(a.getArtId());
		}

		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
			
		model.addAttribute("list", list);
		model.addAttribute("alist", alist);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("selectCateList model : " + model);
		
		return "category/cateList";
	}
}