package com.project.reply.service;

import java.util.List;

import com.project.reply.dao.ReplyDao;
import com.project.reply.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDao replyDao;

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public boolean insertReply(ReplyVO replyVO) {
		
		int a = replyDao.insertReply(replyVO);
		System.out.println("test" + a);
		return a > 0 ;
	}

	@Override
	public List<ReplyVO> selectAllreplies(ReplyVO replyVO) {
		
		return replyDao.selectAllreplies(replyVO);
	}

	
	
}
