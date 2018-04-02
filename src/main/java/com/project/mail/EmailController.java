package com.project.mail;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.service.MemberService;

@Controller
public class EmailController {

	private EmailSender emailSender;
	private Email email;
	private MemberService memberService;
		
	public void setEmailSender(EmailSender emailSender) {
		this.emailSender = emailSender;
	}
	public void setEmail(Email email) {
		this.email = email;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="/sendpw", method=RequestMethod.POST)
	public ModelAndView sendEmailAction (@RequestParam String mail) throws Exception {
		ModelAndView view = new ModelAndView();
		System.out.println(mail);
		String pw = memberService.findPassword(mail);
		
		if ( pw != null ) {
			email.setContent("비밀번호 : " + pw);
			email.setReceiver(mail);
			email.setSubject( mail +"님 비밀번호 찾기 메일 입니다.");
			emailSender.sendMail(email);
			System.out.println("1");
			view = new ModelAndView("redirect:/");
		}
		else {
			System.out.println("2");
			view = new ModelAndView("redirect:/");
			
		}
		System.out.println("3");
		return view;
	}
	
	@RequestMapping("/test")
	public String test() {
		
		System.out.println("~~!!!!");
		return "/";
		
	}
	
	
	
	
}
