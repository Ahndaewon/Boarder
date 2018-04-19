package com.project.reply.web;

import org.springframework.stereotype.Controller;

import com.project.reply.service.ReplyService;

@Controller
public class ReplyController {
	
	private ReplyService replyService;

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	

}
