package com.project.boader.service;

import java.util.List;

import com.project.boader.vo.ArticleIpVO;
import com.project.boader.vo.ArticleLikeVO;
import com.project.boader.vo.ArticleVO;
import com.project.util.Pager;

public interface BoarderService {
	
	
	public boolean insertArticle(ArticleVO articleVO, ArticleIpVO articleIp);
		
	public  List<ArticleVO> selectAll(Pager pager);	

	public ArticleVO selectViewPage(int id);
	
	public int selectAllcount();
	
	public boolean removeArticle(int id);
	
	public boolean increamentViewCount(int articleId, String memberId, String ip);
	
	public List<ArticleVO> selectCategory1();
	
	public boolean updateArticle(ArticleVO article, ArticleIpVO newArticleIpVO);
	
	public int likeAction(ArticleLikeVO likeVO);
	
	public int selectLike(int articleId, String memberId);
	
	public int likeCount(int articleId);
	
	
	
	
}
