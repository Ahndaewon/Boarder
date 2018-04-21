package com.project.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public int insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> selectAllreplies( Map<String, Object> replyMap  );
	
	public List<HashMap<String, Integer>> repliesCount();
	
	public int articleReplyCount(int id);
	
}
