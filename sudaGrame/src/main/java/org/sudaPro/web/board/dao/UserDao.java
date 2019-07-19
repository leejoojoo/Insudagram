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
	public int fillHeart(int b_code, int m_code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_code", b_code);
		map.put("m_code", m_code);
		int count = session.insert(namespace+".fillHeart", map);
		return count;
	}

	@Override
	public int outLineHeart(int b_code,int m_code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_code", b_code);
		map.put("m_code", m_code);
		int count = session.delete(namespace+".outLineHeart", map);
		return count;
	}

	@Override
	public int updateG_cnt(int b_code) throws SQLException {
		int count = session.selectOne(namespace+".updateG_cnt", b_code);
		return count;
	}

	@Override
	public int insertFollow(int m_code, int m_code2) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_code", m_code);
		map.put("m_code", m_code2);
		int count = session.insert(namespace+".insertFollow", map);
		return count;
	}

	@Override
	public int deleteFollow(int m_code, int m_code2) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_code", m_code);
		map.put("m_code", m_code2);
		int count = session.delete(namespace+".deleteFollow", map);
		return count;
	}
	
	
	
	
	
	
	


	
	

}
