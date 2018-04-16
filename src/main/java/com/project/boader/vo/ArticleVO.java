package com.project.boader.vo;

import java.io.File;
import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.project.member.vo.MemberVO;

public class ArticleVO {

	private int id;
	private String memberId;

	@NotEmpty(message = "제목을 입력하세요")
	private String title;
	@NotEmpty(message = "내용을 입력하세요")
	private String body;
	private String writeDate;
	private int viewCount;
	private int recommendCount;
	private int IpId;
	private String fileName;
	private MultipartFile file;
	private MemberVO memberVO;
	private ArticleIpVO articleIpVO;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public int getIpId() {
		return IpId;
	}

	public void setIpId(int ipId) {
		IpId = ipId;
	}

	public String getFileName() {
		if (fileName == null) {
			fileName = "";
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public ArticleIpVO getArticleIpVO() {
		return articleIpVO;
	}

	public void setArticleIpVO(ArticleIpVO articleIpVO) {
		this.articleIpVO = articleIpVO;
	}

	public String save() {

		if (file != null && !file.isEmpty()) {

			fileName = file.getOriginalFilename();
			System.out.println("filename" + file.getOriginalFilename());
			File newFile = new File("D:\\Upload/" + file.getOriginalFilename());

			try {
				file.transferTo(newFile);
				return newFile.getAbsolutePath();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (IllegalStateException e) {
				throw new RuntimeException(e.getMessage(), e);
			}

		}
		return null;

	}

}
