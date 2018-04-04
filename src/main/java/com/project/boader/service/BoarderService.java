package com.project.boader.service;

import java.util.List;

import com.project.boader.vo.ArticleVO;

public interface BoarderService {
	
	
	public boolean insertArticle(ArticleVO articleVO);
		
	public  List<ArticleVO> selectAll();	

	public ArticleVO selectViewPage(int id);
}
