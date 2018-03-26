package com.project.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class LoginVO {
	
	@NotNull(message = "아이디 필수 입력~~~~")
	@NotEmpty(message = "아이디 필수 입력~~~~")
	String id;
	
	@NotNull(message = "비밀번호 필수 입력~~~~")
	@NotEmpty(message = "비밀번호 필수 입력~~~~")
	String password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
	
	

}
