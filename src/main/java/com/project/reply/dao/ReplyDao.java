package com.project.reply.dao;

import java.util.List;

import com.project.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public int insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> selectAllreplies(ReplyVO replyVO);
	
}
