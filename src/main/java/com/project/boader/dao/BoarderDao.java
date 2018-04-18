package com.project.boader.dao;

import java.util.List;

import com.project.boader.vo.ArticleIpVO;
import com.project.boader.vo.ArticleLikeVO;
import com.project.boader.vo.ArticleVO;
import com.project.util.Pager;

public interface BoarderDao {
	
	public int insertArticle(ArticleVO articleVO);
	
	public List<ArticleVO> selectAll(Pager pager);
	
	public ArticleVO selectViewPage(int id); 
	
	public int selectAllcount();
	
	public int removeArticle(int id);
	
	public int increamentViewCount(int id);
	
	public List<ArticleVO> selectCategory1();
	
	public int updateArticle(ArticleVO article);
	
	public int removeAtricleIp(int id);
	
	
	

	public ArticleIpVO selectViewIp(String memberId, int articleId);
	
	public int updateArticleIp(ArticleIpVO articleIpVO);
	
	public int insertIp(ArticleIpVO articleIpVO);
	
	public int selectGetIpId();
	
	public int selectGetArticleId();
	
	
	//좋아요
	public int insertLike(ArticleLikeVO likeVO);
	
	public int likeCount(int id);
	
	public int selectLike(int articleId, String memberId);
	
	public int deleteLike(int articleId, String memberId);
}
