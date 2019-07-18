package org.sudaPro.web.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.board.vo.UserVo;

@Repository
public class UserDao implements UserDaoInterface{
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.sudaPro.web.board.dao.UserDaoInterface";
	
	@Override
	public int userNickName(String nickName) throws SQLException {
		int count1 = session.selectOne(namespace+".nickName", nickName);
		return count1;
	}
	
	@Override
	public int userEmailCheck(String userEmail) throws SQLException {
		int count2 = session.selectOne(namespace+".userEmail", userEmail);
		return count2;
	}
	
	@Override
	public int insertMember(UserVo userVo) throws SQLException {
		int count = session.insert(namespace+".insertMember", userVo);
		//인서트 작업 성공시 1리턴
		return count;
	}

	@Override
	public int fillHeart(int b_code) throws SQLException {
		int count = session.insert(namespace+".fillHeart", b_code);
		return count;
	}

	@Override
	public int outLineHeart(int b_code) throws SQLException {
		int count = session.delete(namespace+".outLineHeart", b_code);
		return count;
	}
	
	@Override
	public UserVo getUser(String principal) {
		return session.selectOne(namespace + ".getUser",principal);
	}
	


	
	

}
