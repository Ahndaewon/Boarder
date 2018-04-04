package com.project.boader.dao;

import java.util.List;

import com.project.boader.vo.ArticleVO;

public interface BoarderDao {
	
	public int insertArticle(ArticleVO articleVO);
	
	public List<ArticleVO> selectAll();
	
	public ArticleVO selectViewPage(int id); 
	
}
