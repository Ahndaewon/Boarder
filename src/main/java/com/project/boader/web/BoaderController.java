package com.project.boader.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.boader.service.BoarderService;
import com.project.boader.vo.ArticleVO;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;

@Controller
public class BoaderController {
	
	private BoarderService boarderService;
	



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

	@RequestMapping(value="/write1", method=RequestMethod.GET)
	public String article1() {
		
		return "/category/categoryWrite1";
	}

	@RequestMapping(value="/write1", method=RequestMethod.POST)
	public ModelAndView categoryWrite(@ModelAttribute("articleForm") ArticleVO articleVO, HttpServletRequest request, HttpSession session) {
		
		ModelAndView view = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("__USER__");
		if ( member == null ) {
			return new ModelAndView("redirect:/");
		}
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(member.getId());
		articleVO.setRequestIp(request.getRemoteAddr());
		articleVO.setMemberId(member.getId());
		
		if( articleVO != null ) {
			
			boarderService.insertArticle(articleVO);
			return new ModelAndView("redirect:/category1");
			
		}
		
		return new ModelAndView("redirect:/write1");
		
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
