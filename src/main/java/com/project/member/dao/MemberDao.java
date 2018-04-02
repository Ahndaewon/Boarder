package com.project.member.dao;

import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;

public interface MemberDao {
	
	public int insertMember(MemberVO memberVO);
	public MemberVO loginMember(LoginVO memberVO);
	public int selectMemberId(String id);
	public int selectMemberNickname(String nickname);
	public int selectMemberEmail(String email);
	public String selectMemberPw(String email);
	
}
