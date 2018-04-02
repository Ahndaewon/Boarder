package com.project.member.web;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.mail.Email;
import com.project.member.service.MemberService;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;


@Controller
public class MemberController {
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="/join", method = RequestMethod.GET )
	public String join() {
		
		return "join";
	}
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("joinform") @Valid MemberVO memberVO, Errors errors) {
		
		if ( errors.hasErrors() ) {
			return new ModelAndView("join");
		}
		
		
		if ( memberVO != null && memberService.createMember(memberVO) ) {
			//성공
			return new ModelAndView("main");
		}
		
		//실패
		return new ModelAndView("main");
	}	
	
	
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView doLoginAction(@ModelAttribute("loginForm") @Valid LoginVO loginVO
									, Errors errors, HttpSession session) {
		
		
		
		if (errors.hasErrors()) {
			System.out.println("에러");
			return new ModelAndView("main");
		}
		//나머지 파라미터 때문에 에러
		 
		MemberVO loginMember = memberService.doLogin(loginVO);
		System.out.println(loginMember.getId());
		System.out.println(loginMember.getEmail());
		System.out.println(loginMember.getPassword());
		
		if( loginMember == null ) {
			return new ModelAndView("redirect:/");
		}
		System.out.println("~~~~~~~~~~~~~~~~~~~~~!!!~~~~~~~~~~~");
		session.setAttribute("__USER__", loginMember);
		System.out.println("로그인됨");
		MemberVO member = (MemberVO)session.getAttribute("__USER__");
		System.out.println(member.getId());
		System.out.println(member.getEmail());
		System.out.println(member.getPassword());

		
		
		
		return new ModelAndView("main");
		
		
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		System.out.println("로그아웃");
		
		return "main";
	}

	@RequestMapping(value="/api/exists/id", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestParam String id){
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		
		
		boolean isExists =  memberService.checkMemberId(id);
		
		response.put("response", isExists);
		
		
		
		return response;
		
	}
	
	@RequestMapping(value="/api/exists/nickname", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> checkNickname(@RequestParam String nickname){
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		
		
		boolean isExists =  memberService.checkMemberNickname(nickname);
		
		response.put("response", isExists);
		
		
		
		return response;
		
	}
	
	@RequestMapping(value="/api/exists/email", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> checkEmail(@RequestParam String email){
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		
		
		boolean isExists =  memberService.checkMemberEmail(email);
		
		response.put("response", isExists);
		
		
		
		return response;
		
	}
	
	@RequestMapping("/find")
	public String findIdPw() {
		
		return "find";
	}
	
	
	

}
