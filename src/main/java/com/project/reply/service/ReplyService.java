package com.project.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.reply.vo.ReplyVO;

public interface ReplyService {

	public boolean insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> selectAllreplies(Map<String, Object> replyMap );
	
	public List<HashMap<String, Integer>> repliesCount();
	
	public int articleReplyCount(int id);
}
