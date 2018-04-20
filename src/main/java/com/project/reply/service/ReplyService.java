package com.project.reply.service;

import java.util.List;

import com.project.reply.vo.ReplyVO;

public interface ReplyService {

	public boolean insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> selectAllreplies(int id);
}
