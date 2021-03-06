package com.project.boader.service;

import java.util.List;

import com.project.boader.dao.BoarderDao;
import com.project.boader.vo.ArticleIpVO;
import com.project.boader.vo.ArticleLikeVO;
import com.project.boader.vo.ArticleVO;
import com.project.util.Pager;

public class BoarderServiceImlp implements BoarderService {

	
	private BoarderDao boarderDao;
	
	
	public void setBoarderDao(BoarderDao boarderDao) {
		this.boarderDao = boarderDao;
	}


	@Override
	public boolean insertArticle(ArticleVO articleVO, ArticleIpVO articleIp) {
		
		//Iptable ID
		int ipId = boarderDao.selectGetIpId();
		
		int articleId = boarderDao.selectGetArticleId();
		
		articleVO.setIpId(ipId);
		articleVO.setId(articleId);
		
		articleIp.setId(ipId);
		articleIp.setArticleId(articleId);
		articleIp.setOwner(1);
		
		
		boolean isSuccess = boarderDao.insertIp(articleIp) > 0;
		
		
		if ( boarderDao.insertArticle(articleVO) > 0 && isSuccess ) {
			
			return true;
			
		}
		
		return false;
	}


	@Override
	public List<ArticleVO> selectAll(Pager pager) {
		
		List<ArticleVO> articleList = boarderDao.selectAll(pager); 
		
		
		if ( articleList != null ) {
			
			return articleList;
		}
		
		return null;
			
	}


	@Override
	public ArticleVO selectViewPage(int id) {
		
		ArticleVO article = boarderDao.selectViewPage(id);
		
		if ( article == null) {
			return null;
		}
		
		
		
		return article;
	}


	@Override
	public int selectAllcount() {
		
		return boarderDao.selectAllcount();
		
	}


	@Override
	public boolean removeArticle(int id) {
		
		
		boolean isSuccess = boarderDao.removeAtricleIp(id) > 0;
		
		
		if( boarderDao.removeArticle(id) > 0 && isSuccess ) {
			return true;
		}
		
		return false;
	}


	@Override
	public boolean increamentViewCount(int articleId, String memberId, String ip) {
		
		
		ArticleIpVO articleIpVO = boarderDao.selectViewIp(memberId, articleId);
		System.out.println(articleIpVO);
		if ( articleIpVO == null ) {
		
			ArticleIpVO articleIp = new ArticleIpVO();
			int id;
			id = boarderDao.selectGetIpId();
			

			articleIp.setId(id);
			articleIp.setMemberId(memberId);
			articleIp.setArticleId(articleId);
			articleIp.setRequestIp(ip);
			articleIp.setOwner(0);
			
			boarderDao.insertIp(articleIp);
			boarderDao.increamentViewCount(articleId);
			
			return true;
		}
		
			return false;
		
	}


	@Override
	public List<ArticleVO> selectCategory1() {
		
		return boarderDao.selectCategory1();
		
	}


	@Override
	public boolean updateArticle(ArticleVO article, ArticleIpVO newArticleIpVO) {

		int id = article.getId();
		
		newArticleIpVO.setArticleId(id);
		
		boolean isSuccess = false;
		
		if ( newArticleIpVO.getRequestIp() != null ) {
			boarderDao.updateArticleIp(newArticleIpVO);
			isSuccess = true;
		}
		
		if ( boarderDao.updateArticle(article) > 0 && isSuccess ) {
			return true;
		}
		
		return false;
	}


	@Override
	public int likeAction(ArticleLikeVO likeVO) {
		
		boolean isExists;
		
		int articleId = likeVO.getArticleId();
		String memberId = likeVO.getMemberId();
		
		//해당글에 대한 좋아요가 있는지 체크
		isExists = boarderDao.selectLike(articleId, memberId) > 0;
		
		if ( isExists ) {
			//있으면 삭제
			boarderDao.deleteLike(articleId, memberId);
		}
		else {
			//없으면 추가
			boarderDao.insertLike(likeVO);
		}
		//좋아요 개수
		int count = boarderDao.likeCount(articleId);
		
		ArticleVO article = boarderDao.selectViewPage(articleId);
		
		ArticleVO newArticle = new ArticleVO();
		
		newArticle.setRecommendCount(count);
		newArticle.setFileName( article.getFileName() );
		newArticle.setId(articleId);
		
		boarderDao.updateArticle(newArticle);
		
		return count;
	}


	@Override
	public int selectLike(int articleId, String memberId) {
 
		return boarderDao.selectLike(articleId, memberId);
	}


	@Override
	public int likeCount(int articleId) {
		return boarderDao.likeCount(articleId);
	}


	




}
