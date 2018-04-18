package com.project.member.service;

import com.project.member.dao.MemberDao;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;
import com.project.util.SHA256Util;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public boolean checkMemberId(String id) {

		if (memberDao.selectMemberId(id) > 0) {

			return true;
		}

		return false;
	}
	
	@Override
	public boolean checkMemberNickname(String nickname) {
		if (memberDao.selectMemberNickname(nickname) > 0) {

			return true;
		}

		return false;
	}

	@Override
	public boolean checkMemberEmail(String email) {
		if (memberDao.selectMemberEmail(email) > 0) {

			return true;
		}

		return false;
	}
	
	
	
	

	@Override
	public boolean createMember(MemberVO memberVO) {
		
		String salt = SHA256Util.generateSalt();
		memberVO.setSalt(salt);
		
		String password = memberVO.getPassword();
		
		password = SHA256Util.getEncrypt(password, salt);
		
		memberVO.setPassword(password);
		
		
		if ( memberDao.insertMember(memberVO)  > 0 ) {
				return true;
		}
		return false;
			
	}

	@Override
	public MemberVO doLogin(LoginVO login) {
		
		
		String id = login.getId();
		String password = login.getPassword();
		
		String salt = memberDao.selectSalt(id);
		
		if ( salt == null ) {
			return null;
		}
		
		password = SHA256Util.getEncrypt(password, salt);
		login.setPassword(password);
		
		
		return memberDao.loginMember(login);
		
	}

	@Override
	public String findPassword(String email) {
		if (memberDao.selectMemberPw(email) != null  ) {
			return memberDao.selectMemberPw(email);
		}
		return null;
	}

	@Override
	public int updateToken(String token, String id) {
		return memberDao.updateToken(token, id);
	}

	@Override
	public MemberVO selectMember(String id) {
		return memberDao.selectMember(id);
	}

	@Override
	public int updatePassword(String password, String id) {
		
		String salt = SHA256Util.generateSalt();
		
		password = SHA256Util.getEncrypt(password, salt);
		
		
		return memberDao.updatePassword(password, id, salt);
	}

	@Override
	public long selectTime() {
		return memberDao.selectTime();
	}

	


}
