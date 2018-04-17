package com.project.boader.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.boader.vo.ArticleIpVO;
import com.project.boader.vo.ArticleLikeVO;
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
	public int removeAtricleIp(int id) {
		return getSqlSession().delete("BoarderDao.removeAtricleIp", id);
	}
	
	
	@Override
	public int increamentViewCount(int id) {
		return getSqlSession().update("BoarderDao.increamentViewCount", id);
	}

	@Override
	public List<ArticleVO> selectCategory1() {
		
		return getSqlSession().selectList("BoarderDao.selectCategory1");
	}

	@Override
	public int updateArticle(ArticleVO article) {
		return getSqlSession().update("BoarderDao.updateArticle", article);
	}

	@Override
	public int insertIp(ArticleIpVO articleIpVO) {
		
		return getSqlSession().insert("BoarderDao.insertIp", articleIpVO);
	}

	@Override
	public int selectGetIpId() {
		return getSqlSession().selectOne("BoarderDao.selectGetIpId");
	}

	@Override
	public int selectGetArticleId() {
		return getSqlSession().selectOne("BoarderDao.selectGetArticleId");
	}

	@Override
	public int updateArticleIp(ArticleIpVO articleIpVO) {
		return getSqlSession().update("BoarderDao.updateArticleIp");
	}

	@Override
	public ArticleIpVO selectViewIp(String memberId ,int articleId) {
		
		Map<String, Object> idMap = new HashMap<String, Object>();
		
		idMap.put("memberId", memberId);
		idMap.put("articleId", articleId);
		
		return getSqlSession().selectOne("BoarderDao.selectViewIp", idMap);
	}

	@Override
	public int insertLike(ArticleLikeVO likeVO) {
		return getSqlSession().insert("BoarderDao.insertLike", likeVO);
	}

	@Override
	public int likeCount(int id) {
		return getSqlSession().selectOne("BoarderDao.likeCount", id );
	}

	@Override
	public int selectLike(ArticleLikeVO likeVO) {
		
		return getSqlSession().selectOne("BoarderDao.selectLike", likeVO);
	}

	

	
	
	




}
