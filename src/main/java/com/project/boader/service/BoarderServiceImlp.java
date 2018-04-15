package com.project.boader.service;

import java.util.List;

import com.project.boader.dao.BoarderDao;
import com.project.boader.vo.ArticleVO;
import com.project.util.Pager;

public class BoarderServiceImlp implements BoarderService {

	
	private BoarderDao boarderDao;
	
	
	public void setBoarderDao(BoarderDao boarderDao) {
		this.boarderDao = boarderDao;
	}


	@Override
	public boolean insertArticle(ArticleVO articleVO) {
		
		System.out.println(articleVO.getFileName());
		
		if ( boarderDao.insertArticle(articleVO) > 0) {
			
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
		
		if( boarderDao.removeArticle(id) > 0 ) {
			return true;
		}
		
		return false;
	}


	@Override
	public boolean increamentViewCount(int id) {
		
		
		
		if ( boarderDao.increamentViewCount(id) > 0 ) {
			
			return true;
		}
		
		
		return false;
	}


	@Override
	public List<ArticleVO> selectCategory1() {
		
		return boarderDao.selectCategory1();
		
	}


	@Override
	public boolean updateArticle(ArticleVO article) {

		if ( boarderDao.updateArticle(article) > 0 ) {
			return true;
		}
		
		return false;
	}





}
