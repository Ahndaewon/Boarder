package com.project.member.dao;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public String selectMemberPw(String email) {
		return getSqlSession().selectOne("MemberDao.selectMemberPw", email);
	}

	@Override
	public String selectSalt(String id) {
		return getSqlSession().selectOne("MemberDao.selectSalt", id);
	}

	@Override
	public int updateToken(String token, String id) {
		
		Map<String, String> tokenMap = new HashMap<String, String>();
		tokenMap.put("id", id);
		tokenMap.put("token", token);
		
		
		return getSqlSession().update("MemberDao.updateToken", tokenMap);
	}

	@Override
	public MemberVO selectMember(String id) {
		return getSqlSession().selectOne("MemberDao.selectMember", id);
	}

	@Override
	public int updatePassword(String password, String id, String salt) {
		
		Map<String, String> passMap = new HashMap<String, String>();
		passMap.put("password", password);
		passMap.put("id", id);
		passMap.put("salt", salt);
		
		return getSqlSession().update("MemberDao.updatePassword", passMap);
	}

	@Override
	public long selectTime() {
		return getSqlSession().selectOne("MemberDao.selectTime");
	}

	
	
	
}
