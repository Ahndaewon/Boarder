package com.project.reply.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.constants.Member;
import com.project.member.vo.MemberVO;
import com.project.reply.service.ReplyService;
import com.project.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	
	private ReplyService replyService;

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	/*@RequestMapping("test1")
	public void test1() {
		
		System.out.println("aksjdfhaklsjdhflkasjfh");
	}*/
	
	
	@RequestMapping(value="/reply/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> replyGet(@PathVariable int id ,HttpSession session, ReplyVO replyVO){
	
		Map<String, Object> replyMap = new HashMap<String, Object>();
		
		
		
		return replyMap;
	}
	
	
	
	@RequestMapping(value="/reply/{id}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyAction(@PathVariable int id ,HttpSession session, ReplyVO replyVO){
		
		Map<String, Object> replyMap = new HashMap<String, Object>();
		
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		
		replyVO.setArticleId(id);
		replyVO.setMemberId(member.getId());
		
		boolean isSuccess;
		System.out.println("asdfasdf");
		isSuccess = replyService.insertReply(replyVO);
		
		if ( isSuccess ) {
			//댓글 등록 성공
			replyMap.put("isSuccess","isSuccess");
		}
		
		return replyMap;
		
		
	}

	
	

}
