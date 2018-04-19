package com.project.reply.service;

import com.project.reply.dao.ReplyDao;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDao replyDao;

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	
	
}
