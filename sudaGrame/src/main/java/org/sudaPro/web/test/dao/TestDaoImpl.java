package org.sudaPro.web.test.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TestDaoImpl implements TestDao{
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.TestMapper";
	
	@Override
	public int test(int n) {
		return session.selectOne(namespace+".getNumber", n);
	}
}
