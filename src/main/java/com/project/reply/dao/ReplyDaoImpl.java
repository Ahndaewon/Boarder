package com.project.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.reply.vo.ReplyVO;

public class ReplyDaoImpl extends SqlSessionDaoSupport implements ReplyDao{

	@Override
	public int insertReply(ReplyVO replyVO) {
		System.out.println("replyDao");
		return getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}

	@Override
	public List<ReplyVO> selectAllreplies( int id ) {
		return getSqlSession().selectList("ReplyDao.selectAllreplies", id );
	}

	@Override
	public List<HashMap<String, Integer>> repliesCount() {
		return getSqlSession().selectList("ReplyDao.repliesCount");
	}

}
