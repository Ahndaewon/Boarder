package com.project.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class MemberVO extends LoginVO {

	@NotNull(message = "이름 필수 입력~~~~")
	@NotEmpty(message = "이름 필수 입력~~~~")
	String name;
	@NotNull(message = "닉네임 필수 입력~~~~")
	@NotEmpty(message = "닉네임 필수 입력~~~~")
	String nickname;
	@NotNull(message = "이메일은 필수 입력~~~~")
	@NotEmpty(message = "이메일은 필수 입력~~~~")
	String email;
	String registrationDate;
	int grade;
	int accessCount;
	String salt;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getAccessCount() {
		return accessCount;
	}

	public void setAccessCount(int accessCount) {
		this.accessCount = accessCount;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	

}
