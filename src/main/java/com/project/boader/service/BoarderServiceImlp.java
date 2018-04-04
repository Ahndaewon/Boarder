package com.project.boader.service;

import java.util.List;

import com.project.boader.dao.BoarderDao;
import com.project.boader.vo.ArticleVO;

public class BoarderServiceImlp implements BoarderService {

	
	private BoarderDao boarderDao;
	
	
	public void setBoarderDao(BoarderDao boarderDao) {
		this.boarderDao = boarderDao;
	}


	@Override
	public boolean insertArticle(ArticleVO articleVO) {
		
		if ( boarderDao.insertArticle(articleVO) > 0) {
			
			return true;
		}
		
		return false;
	}


	@Override
	public List<ArticleVO> selectAll() {
		
		List<ArticleVO> articleList = boarderDao.selectAll(); 
		
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





}
