package com.project.reply.vo;

import com.project.boader.vo.ArticleVO;
import com.project.member.vo.MemberVO;

public class ReplyVO {

	private int level;
	private int id;
	private String memberId;
	private int articleId;
	private String body;
	private String registDate;
	private int parentReplyId;

	private MemberVO memberVO;
	private ArticleVO articleVO;

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public int getParentReplyId() {
		return parentReplyId;
	}

	public void setParentReplyId(int parentReplyId) {
		this.parentReplyId = parentReplyId;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public ArticleVO getArticleVO() {
		return articleVO;
	}

	public void setArticleVO(ArticleVO articleVO) {
		this.articleVO = articleVO;
	}

}
