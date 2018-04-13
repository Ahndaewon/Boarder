package com.project.boader.dao;

import java.util.List;

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
	
}
