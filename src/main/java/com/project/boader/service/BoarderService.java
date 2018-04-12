package com.project.boader.service;

import java.util.List;

import com.project.boader.vo.ArticleVO;
import com.project.util.Pager;

public interface BoarderService {
	
	
	public boolean insertArticle(ArticleVO articleVO);
		
	public  List<ArticleVO> selectAll(Pager pager);	

	public ArticleVO selectViewPage(int id);
	
	public int selectAllcount();
	
	public boolean removeArticle(int id);
	
	public boolean increamentViewCount(int id);
	
}
