package com.project.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.reply.dao.ReplyDao;
import com.project.reply.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDao replyDao;

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public boolean insertReply(ReplyVO replyVO) {
		
		String body = replyVO.getBody();
		body = body.replace("\r\n", "<br/>");
		System.out.println("body : " + body );
		System.out.println("replyVO : " + replyVO.getBody() );

		replyVO.setBody(body);
		
		return replyDao.insertReply(replyVO) > 0 ;
	}

	@Override
	public List<ReplyVO> selectAllreplies(int id ) {
		
		return replyDao.selectAllreplies(id);
	}

	@Override
	public List<HashMap<String, Integer>> repliesCount() {
		
		List<HashMap<String, Integer>> listMap;
		listMap = replyDao.repliesCount();
		
		return listMap;
	}

	
	
}
