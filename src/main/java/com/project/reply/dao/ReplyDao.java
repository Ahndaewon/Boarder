package com.project.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public int insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> selectAllreplies( int id );
	
	public List<HashMap<String, Integer>> repliesCount();
	
}
