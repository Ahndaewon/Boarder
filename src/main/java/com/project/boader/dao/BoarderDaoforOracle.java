package com.project.boader.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.boader.vo.ArticleVO;



public class BoarderDaoforOracle extends SqlSessionDaoSupport implements BoarderDao{

	@Override
	public int insertArticle(ArticleVO articleVO) {
		
		return getSqlSession().insert("BoarderDao.insertArticle", articleVO);
	}

	@Override
	public List<ArticleVO> selectAll() {
		return getSqlSession().selectList("BoarderDao.selectAll");
	}

	
	
	
	
	




}
