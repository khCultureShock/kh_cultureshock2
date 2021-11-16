package com.kh.spring.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.demo.model.service.DemoService;
import com.kh.spring.demo.model.vo.Dev;

@Controller
public class DemoController {

	@Autowired
	DemoService demoService;
	
	@RequestMapping("/demo/demo.do")
	public String demo1() {
		System.out.println("/demo/demo.do가 호출되었습니다!");
		
		return "demo/demo";
	}
	
	@RequestMapping("/demo/demo1.do")
	public String demo1(HttpServletRequest request) {
		
		String devName = request.getParameter("devName");
		int devAge = Integer.parseInt(request.getParameter("devAge"));
		String devEmail = request.getParameter("devEmail");
		String devGender = request.getParameter("devGender");
		String[] devLang = request.getParameterValues("devLang");
		
		Dev dev = new Dev();
		
		dev.setDevName(devName);
		dev.setDevAge(devAge);
		dev.setDevEmail(devEmail);
		dev.setDevGender(devGender);
		dev.setDevLang(devLang);
		
		System.out.println("demo1.do [dev] : " + dev);
		
		request.setAttribute("dev", dev);
				
		return "demo/demoResult";
		
	}
	
	@RequestMapping("/demo/demo2.do")
	public String demo2(
				@RequestParam(value="devName") String devName,
				@RequestParam(value="devAge", required=false, defaultValue="20") int devAge,
				@RequestParam("devEmail") String devEmail,
				@RequestParam String devGender,
				@RequestParam String[] devLang,
				HttpServletRequest request
			) {
		// required(필수) 속성은 기본값이 true이다.
		
		Dev dev = new Dev();
		dev.setDevName(devName);
		dev.setDevAge(devAge);
		dev.setDevEmail(devEmail);
		dev.setDevGender(devGender);
		dev.setDevLang(devLang);
		
		System.out.println("demo2.do [dev] :" + dev);
		
		request.setAttribute("dev", dev);		
		
		return "demo/demoResult";
	}
	
	@RequestMapping("/demo/demo3.do")
	public String demo3(Dev dev, Model model) {
		// CommandMap : 스프링이 만들어 연결해주는 객체형태
		// Model : HttpServletRequest + HttpServletResponse
		
		System.out.println("demo3.do [dev] : " + dev);
		
		model.addAttribute("dev", dev);
		
		return "demo/demoResult";
		
	}
	
	@RequestMapping("/demo/insertDev.do")
	public String insertDev(Dev dev) {
		int result = demoService.insertDev(dev);
		
		System.out.println("dev insert 결과 : " + result);
		
		// 기본적으로 DispatcherServlet은 forward방식을 사용한다.
		// 만약 redirect 방식의 통신이 필요할 경우
		// "redirect:url주소"를 사용하면 된다.
		return "redirect:/";   // /: welcome-file로 돌아가라, /views/... ...
		
	}
	
	@RequestMapping("/demo/selectDevList.do")
	public String selectDevList(Model model) {
		
		List<Dev> list = demoService.selectDevList();
		
		System.out.println("devlist : " + list);
		
		model.addAttribute("list", list);
		
		return "demo/devList";
		
	}
	
	@RequestMapping("/demo/updateDev.do")
	public String updateDev(Model model, @RequestParam int no) {
		
		Dev dev = demoService.selectDev(no);
		
		model.addAttribute("dev", dev);
		
		return "demo/devForm";
	}
	
	@RequestMapping("/demo/updateDevEnd.do")
	public String updateDev(Dev dev) {
		
		int result = demoService.updateDev(dev);
		
		System.out.println("update 결과 : " + result);
		
		return "redirect:/demo/selectDevList.do";		
	}
	
	@RequestMapping("/demo/deleteDev.do")
	public String deleteDev(@RequestParam int no) {
		int result = demoService.deleteDev(no);
		
		System.out.println("delete 결과 : " + result);
		
		return "redirect:/demo/selectDevList.do";
	}
}












