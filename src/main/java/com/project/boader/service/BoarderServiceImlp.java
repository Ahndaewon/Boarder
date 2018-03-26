package com.project.boader.service;

import com.project.boader.dao.BoarderDao;
import com.project.boader.vo.Test;

public class BoarderServiceImlp implements BoarderService {

	
	BoarderDao boarderDao;
	
	
	public void setBoarderDao(BoarderDao boarderDao) {
		this.boarderDao = boarderDao;
	}




	@Override
	public boolean testService() {
		
		if ( boarderDao.intputTest() > 0 ) {
			
			return true;
		}
		return false;
	}

}
