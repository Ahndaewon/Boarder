package com.project.member.service;

import com.project.member.vo.LoginVO;
import com.project.member.vo.MemberVO;

public interface MemberService {
	
	public boolean createMember(MemberVO memberVO ); 
	
	public boolean checkMemberId(String id);
	public boolean checkMemberNickname(String nickname);
	public boolean checkMemberEmail(String email);
	public MemberVO doLogin(LoginVO memberVO);
	public String findPassword(String email);
	public int updateToken(String token, String id);
	
	public MemberVO selectMember(String id);
	
	public int updatePassword(String password, String id);
	public long selectTime();
}
