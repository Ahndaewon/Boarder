package com.project.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;

public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {

	@Override
	public int insertMember(MemberVO memberVO) {
		return getSqlSession().insert("MemberDao.insertMember", memberVO);
	}

	@Override
	public MemberVO loginMember(LoginVO memberVO) {

		return getSqlSession().selectOne("MemberDao.loginMember", memberVO);
	}

	@Override
	public int selectMemberId(String id) {
		return getSqlSession().selectOne("MemberDao.selectMemberId", id);
	}

	@Override
	public int selectMemberNickname(String nickname) {
		return getSqlSession().selectOne("MemberDao.selectMemberNickname", nickname);
	}

	@Override
	public int selectMemberEmail(String email) {
		return getSqlSession().selectOne("MemberDao.selectMemberEmail", email);
	}
	
	
}
