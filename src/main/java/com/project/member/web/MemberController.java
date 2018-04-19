package com.project.member.web;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.boader.service.BoarderService;
import com.project.constants.Member;
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
			/*return new ModelAndView("main");*/
			return new ModelAndView("redirect:/");
		}
		//나머지 파라미터 때문에 에러
		 
		if ( loginVO == null ) {
			
			return new ModelAndView("redirect:/");
		}
		
		MemberVO loginMember = memberService.doLogin(loginVO);
		
		if( loginMember == null ) {
			System.out.println("로그인 실패");
			session.setAttribute("__FAIL__", "fail");
			return new ModelAndView("redirect:/");
		}
		session.setAttribute("__FAIL__", "");// 지워도 될듯
		System.out.println("~~~~~~~~~~~~~~~~~~~~~!!!~~~~~~~~~~~");
		session.setAttribute(Member.USER, loginMember);
		System.out.println("로그인됨");
		
		return new ModelAndView("redirect:/");
		
		
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		System.out.println("로그아웃");
		
		return "redirect:/";
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
	
	@RequestMapping(value = "/findid", method=RequestMethod.POST)
	public ModelAndView findAction(@RequestParam String email ) {
		
		ModelAndView view = new ModelAndView();
		
		String id = memberService.findPassword(email);
		
		if ( id == null ) {
			view.setViewName("find");
			view.addObject("idExists", "idExists");
			return view;
		}
		view.addObject("id", id);
		view.setViewName("findId");
		return view;
	}
	
	@RequestMapping(value = "/changepw/{token}/{id}", method=RequestMethod.GET)
	public String changePassword(@PathVariable String token, @PathVariable String id, HttpSession session ) {
		
		
		MemberVO member =  memberService.selectMember(id);
		if ( member.getToken() == null || member == null) {
			return "info/notlink";
		}
		
		long nowTime = memberService.selectTime();
		
		
		
		
		String tokenTimeStr = member.getTokenTime();
		long tokenTime;
		try {
			tokenTime = Long.parseLong(tokenTimeStr);
			System.out.println(tokenTime + "tokenTime try");
		} catch (NumberFormatException nfe) {
			tokenTime = 0;
		}
		
		System.out.println("현재시간 : " + nowTime);
		System.out.println("토큰시간 : " + tokenTime);
		
		
		long calc = nowTime - tokenTime;
		System.out.println(calc + ": CALC");
		
		//1200 -> 12시간
		if ( calc >= 1200 ) {
			//12시간이 경과하였으면 토큰 삭제
			token = "";
			memberService.updateToken(token, id);
			return "info/notlink";
		}
		
		
		if ( member.getToken().equals(token) ) {
			
			session.setAttribute("id", id);
			
			return "chagePassword";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/changepw", method=RequestMethod.POST)
	public String changePassword(@RequestParam	String password, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		String token = "";
		session.removeAttribute("id");

		//토큰 정보 삭제
		memberService.updateToken(token, id);
		
		
		int check = memberService.updatePassword(password, id);
		
		if ( check <= 0 ) {
			
			return "info/failPassword";
		}
		
		return "info/completePassword";
	}
}
