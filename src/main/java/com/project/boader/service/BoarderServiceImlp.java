package com.project.boader.service;

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





}
