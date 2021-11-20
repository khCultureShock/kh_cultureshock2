package com.kh.spring.notice.controller;

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

import com.kh.spring.notice.model.service.NoticeService;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.common.Utils;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/notice/noticeList.do")
	public String selectNoticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = noticeService.selectNoticeList(cPage, numPerPage);
		
		// 전체 게시글 수
		int totalContents = noticeService.selectNoticeTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "noticeList.do");
		
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/notice/noticeForm.do")
	public String noticeForm() { // 글쓰기 메소드!
		
		return "notice/noticeForm";
	}
	
	@RequestMapping("/notice/noticeFormEnd.do")
	public String insertNotice(Notice notice, Model model, HttpServletRequest req,
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		System.out.println("notice : " + notice);
		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
		String savePath = req.getServletContext().getRealPath("/resources/noticeUpload");
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		// 2. 파일 업로드
		for(MultipartFile f : upFiles) {
			if(f.isEmpty() == false) {
				
				// 3. 파일 이름 변경
				String originName = f.getOriginalFilename(); // 원본 이름
				String changeName = fileNameChanger(originName); // 서버에서 관리할 이름
				
				// 4. 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 5. attachList에 담기
				Attachment a = new Attachment();
				a.setOriginalFileName(originName);
				a.setRenamedFileName(changeName);
				
				attachList.add(a);				
			}
		}
		
		// 6. 게시글 DB에 등록
		int result = noticeService.insertNotice(notice, attachList);
		
		String loc = "/notice/noticeList.do";
		String msg = "";
		
		if( result > 0) {
			msg = "게시글 등록 성공!";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	// 단순 파일 이름 변경 메소드
	public String fileNameChanger(String oldName) {

		String ext = oldName.substring(oldName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext; 
			
	}
	
	@RequestMapping("/notice/noticeView.do")
	public String noticeView(@RequestParam int no, Model model) {
		
		Notice notice = noticeService.selectOneNotice(no);
		/* List<Attachment> attachmentList = noticeService.selectAttachmentList(no); */
		
		model.addAttribute("notice", notice);
		/* model.addAttribute("attachmentList", attachmentList); */
		
		return "notice/noticeView";
	}
	
	/*
	 * @RequestMapping("/notice/fileDownload.do") public void
	 * fileDownload(@RequestParam String oName,
	 * 
	 * @RequestParam String rName, HttpServletRequest request, HttpServletResponse
	 * response) {
	 * 
	 * // 파일 저장 디렉토리(폴더) String saveDirectory =
	 * request.getServletContext().getRealPath("/resources/noticeUpload");
	 * 
	 * BufferedInputStream bis = null; ServletOutputStream sos = null;
	 * 
	 * try { sos = response.getOutputStream();
	 * 
	 * File saveFile = new File(saveDirectory + "/" + rName);
	 * response.setContentType("application/octet-stream; charset=utf-8");
	 * 
	 * String responseFileName = ""; boolean isMSIE =
	 * request.getHeader("user-agent").indexOf("MSIE") != -1 ||
	 * request.getHeader("user-agent").indexOf("Trident") != -1;
	 * System.out.println("익스플로러 인가요? " + isMSIE);
	 * 
	 * if(isMSIE == true) { // IE는 UTF-8 인코딩을 명시적으로 선언해줘야 한다. // 또한 한글, 일본어, 독일어 등과
	 * 같은 외국어를 특수기호로 처리하기 때문에 // 이를 인코딩하여 올바른 문자표기로 변환해주어야 한다. responseFileName =
	 * URLEncoder.encode(oName, "UTF-8"); // 홍길동 -> %ED%99%8D%EA%B8%B8%EB%8F%99
	 * System.out.println("ie표기 : " + responseFileName);
	 * 
	 * responseFileName = responseFileName.replaceAll("\\+", "%20"); } else {
	 * responseFileName = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
	 * System.out.println("일반 표기 : " + responseFileName); }
	 * 
	 * response.addHeader("Content-Disposition", "attachment; filename=\"" +
	 * responseFileName +"\"");
	 * 
	 * // 파일의 크기에 따라 데이터 전송 response.setContentLength((int)saveFile.length());
	 * 
	 * FileInputStream fis = new FileInputStream(saveFile); bis = new
	 * BufferedInputStream(fis); int read = 0;
	 * 
	 * while((read = bis.read()) != -1) { sos.write(read); }
	 * 
	 * } catch (IOException e) { e.printStackTrace();
	 * 
	 * } finally { try { sos.close(); bis.close(); } catch(IOException e) {
	 * e.printStackTrace(); } } }
	 */
	
	@RequestMapping("/notice/noticeUpdateView.do")
	public String noticeUpdateView(@RequestParam int noticeNo, Model model) {
		
		Notice notice = noticeService.updateView(noticeNo);
		
		/*
		 * List<Attachment> attachmentList =
		 * noticeService.selectAttachmentList(noticeNo);
		 */
		
		model.addAttribute("notice", notice);
		/* model.addAttribute("attachmentList", attachmentList); */
		
		return "notice/noticeUpdateView";		
	}
	
	@RequestMapping("/notice/noticeUpdate.do")
	public String noticeUpdate(Notice notice, HttpServletRequest request, Model model, 
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		// 1. 원본 게시글 불러와 수정하기
		int noticeNo = notice.getNoticeNo();
		
		Notice originNotice = noticeService.updateView(noticeNo);
		
		originNotice.setNoticeTitle( notice.getNoticeTitle() );
		originNotice.setNoticeContent( notice.getNoticeContent() );
		
		// 2. 첨부파일 수정하기
		/*
		 * String savePath =
		 * request.getServletContext().getRealPath("/resources/noticeUpload");
		 * 
		 * List<Attachment> attachList = noticeService.selectAttachmentList(noticeNo);
		 * if( attachList == null ) attachList = new ArrayList<Attachment>();
		 * 
		 * int idx = 0; for(MultipartFile f : upFiles) { Attachment temp = null;
		 * 
		 * if( f.isEmpty() == false ) {
		 * 
		 * if(attachList.size() > idx) { // 파일이 있다면 File oldFile = new File(savePath +
		 * "/" + attachList.get(idx).getRenamedFileName());
		 * System.out.println("변경 전 파일 삭제 : " + oldFile.delete());
		 * 
		 * temp = attachList.get(idx); } else { temp = new Attachment();
		 * temp.setBoardNo(noticeNo);
		 * 
		 * attachList.add(temp); }
		 * 
		 * // 파일 저장용 이름 바꾸기 String originName = f.getOriginalFilename(); String
		 * changeName = fileNameChanger(originName);
		 * 
		 * // 파일 저장 try { f.transferTo(new File(savePath + "/" + changeName)); } catch
		 * (IllegalStateException e) { e.printStackTrace(); } catch (IOException e) {
		 * e.printStackTrace(); }
		 * 
		 * temp.setOriginalFileName(originName); temp.setRenamedFileName(changeName);
		 * 
		 * attachList.set(idx, temp); } idx++; }
		 */
		
		int result = noticeService.updateNotice(originNotice);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/notice/noticeList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	/*
	 * @RequestMapping("/notice/fileDelete.do")
	 * 
	 * @ResponseBody public boolean fileDelete(@RequestParam int attNo,
	 * 
	 * @RequestParam String rName, HttpServletRequest request) {
	 * 
	 * String savePath =
	 * request.getServletContext().getRealPath("/resources/noticeUpload");
	 * 
	 * // 1. DB에서 첨부파일 삭제 int result = noticeService.deleteFile(attNo);
	 * 
	 * if( result == 1 ) { File goodbye = new File(savePath + "/" + rName);
	 * 
	 * goodbye.delete();
	 * 
	 * return true; } else { return false; } }
	 */
	
	@RequestMapping("/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam int noticeNo,
							  HttpServletRequest request,
							  Model model) {
		
		String savePath = request.getServletContext().getRealPath("/resources/noticeUpload");
		
		// 첨부파일삭제 명단
		/* List<Attachment> delList = noticeService.selectAttachmentList(noticeNo); */
		
		// 게시글 삭제
		int result = noticeService.deleteNotice(noticeNo); // 서비스 이동~!
		
		String loc = "/notice/noticeList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "삭제 완료!";
			
			/*
			 * for(Attachment a : delList) { new File(savePath + "/" +
			 * a.getRenamedFileName()).delete(); }
			 */
		} else {
			msg = "삭제 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
}














