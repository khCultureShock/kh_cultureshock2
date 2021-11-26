package com.kh.spring.play.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.common.Utils;
import com.kh.spring.play.model.service.PlayService;
import com.kh.spring.play.model.vo.Play;

@Controller
public class PlayController {

	@Autowired
	PlayService playService;
	
	@RequestMapping("/play/playList.do")
	public String selectPlayList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="artArea", required=false, defaultValue="전체") String artArea,
			Model model
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 15;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = playService.selectPlayList(cPage, numPerPage,artArea);
		
		// 전체 게시글 수
		int totalContents = playService.selectPlayTotalContents(artArea);
		
		// 페이지 처리 Utils 사용하기
		String pageBar1 = Utils.getPageBar1(totalContents, cPage, numPerPage, "playList.do",artArea);
		
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar1);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar1);
		
	
		
		return "play/playList";
	}

	
	@RequestMapping("/play/playTestView.do")
	public String playView(@RequestParam int no, Model model) {
		
		Play play = playService.selectOnePlay(no);
		/* List<Attachment> attachmentList = noticeService.selectAttachmentList(no); */
		
		model.addAttribute("play", play);
		/* model.addAttribute("attachmentList", attachmentList); */
		
		return "play/playTestView";
	}
}














