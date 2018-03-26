package com.project.boader.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.project.boader.vo.Test;


public class BoarderDaoforOracle extends SqlSessionDaoSupport implements BoarderDao{

	@Override
	public int intputTest( ) {
		return getSqlSession().insert("BoarderDao.intputTest");
	}




}
