package com.project.boader.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.boader.service.BoarderService;
import com.project.boader.vo.Test;

@Controller
public class BoaderController {
	
	BoarderService boarderService;
	



	public void setBoarderService(BoarderService boarderService) {
		this.boarderService = boarderService;
	}


	@RequestMapping("/")
	public String mainPage() {
		
		
		
		return "main";
	}


	@RequestMapping("/category1")
	public String category1() {
		
		
		return "/category/category1";
	}
	
	@RequestMapping("/category2")
	public String category2() {
		
		
		return "/category/category2";
	}
	
	@RequestMapping("/category3")
	public String category3() {
		
		
		return "/category/category3";
	}
	
	@RequestMapping("/category4")
	public String category4() {
		
		
		return "/category/category4";
	}


		

}
