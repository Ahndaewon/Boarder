package com.project.member.service;

import com.project.member.dao.MemberDao;
import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	MemberDao memberDao;

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
		
		if ( memberDao.insertMember(memberVO)  > 0 ) {
				return true;
		}
		return false;
			
	}

	@Override
	public MemberVO doLogin(LoginVO memberVO) {
		
		return memberDao.loginMember(memberVO);
		
	}

	


}
