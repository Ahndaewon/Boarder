package com.project.boader.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.boader.vo.ArticleVO;
import com.project.util.Pager;



public class BoarderDaoforOracle extends SqlSessionDaoSupport implements BoarderDao{

	@Override
	public int insertArticle(ArticleVO articleVO) {
		
		return getSqlSession().insert("BoarderDao.insertArticle", articleVO);
	}

	@Override
	public List<ArticleVO> selectAll(Pager pager) {
		return getSqlSession().selectList("BoarderDao.selectAll", pager);
	}

	@Override
	public ArticleVO selectViewPage(int id) {
		return getSqlSession().selectOne("BoarderDao.selectViewPage", id);
	}

	@Override
	public int selectAllcount() {
		return getSqlSession().selectOne("BoarderDao.selectAllcount");
	}

	@Override
	public int removeArticle(int id) {
		return getSqlSession().delete("BoarderDao.removeArticle", id);
	}

	@Override
	public int increamentViewCount(int id) {
		return getSqlSession().update("BoarderDao.increamentViewCount", id);
	}

	
	
	




}
