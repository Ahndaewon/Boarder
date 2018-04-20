package com.project.reply.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.reply.vo.ReplyVO;

public class ReplyDaoImpl extends SqlSessionDaoSupport implements ReplyDao{

	@Override
	public int insertReply(ReplyVO replyVO) {
		System.out.println("replyDao");
		return getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}

	@Override
	public List<ReplyVO> selectAllreplies(ReplyVO replyVO) {
		return getSqlSession().selectList("ReplyDao.selectAllreplies", replyVO );
	}

}
