package com.project.mail;


import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.boader.service.BoarderService;
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
		
		String id = memberService.findPassword(mail);
		
		if ( id == null  ) {
			//이메일이 존재하지 않을경우
			view.addObject("exists", "exists");
			view.setViewName("find");
			return view;
		}
		
		
		String token = UUID.randomUUID().toString();
		System.out.println(token);
		
		
		memberService.updateToken(token, id);
		
		String url = "http://localhost:8080/changepw/"+ token +"/"+id;
		
		
		if ( id != null ) {
			email.setContent("비밀번호 변경 링크\n" 
							+"해당 링크는 12시간 이내 1회만 유효합니다.\n"	+ url);
			email.setReceiver(mail);
			email.setSubject( mail +"님 비밀번호 찾기 메일 입니다.");
			emailSender.sendMail(email);
			
			view = new ModelAndView("redirect:/");
		}
		return view;
	}
	
		
	
}
