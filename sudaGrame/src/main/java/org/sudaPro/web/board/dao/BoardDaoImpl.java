package org.sudaPro.web.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.board.vo.BoardAll;
import org.sudaPro.web.board.vo.BoardOne;
import org.sudaPro.web.board.vo.ChildComm;
import org.sudaPro.web.board.vo.Comments;
import org.sudaPro.web.board.vo.Gooder;
import org.sudaPro.web.board.vo.RecommFollowList;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.BoardMapper";
	
	@Override
	public List<BoardAll> getBoardAll(String sort) {
		// System.out.println(sort);
		return session.selectList(namespace+".boardAll", sort);
	}
	@Override
	public BoardOne getBoardOne(int b_code) {
		return session.selectOne(namespace+".boardOne", b_code);
	}
	@Override
	public List<Comments> getComments(int b_code) {
		return session.selectList(namespace+".boardComments", b_code);
	}
	@Override
	public List<String> getImges(int b_code) {
		return session.selectList(namespace+".boardImg", b_code);
	}
	@Override
	public List<ChildComm> getChildComm(int cm_group) {
		return session.selectList(namespace + ".childComment", cm_group);
	}
	@Override
	public int getChildCnt(int b_code, int cm_group) {
		Map<String, Object> parames = new HashMap<String, Object>();
		parames.put("b_code", b_code);
		parames.put("cm_group", cm_group);
		return session.selectOne(namespace+".countChildComm", parames);
	}
	@Override
	public int insertComm(String content, int cm_group, int b_code, int m_code, String pm_id) {
		Map<String, Object> parames = new HashMap<String, Object>();
		parames.put("b_code", b_code);
		parames.put("cm_group", cm_group);
		parames.put("content", content);
		parames.put("m_code", m_code);
		parames.put("pm_id", pm_id);
		return session.insert(namespace+".insertComm", parames);
	}
	@Override
	public List<Gooder> getGoodList(int b_code) {
		return session.selectList(namespace + ".goodList", b_code);
	}
	@Override
	public int myGood(int b_code, int m_code) {
		Map<String, Object> parames = new HashMap<String, Object>();
		parames.put("b_code", b_code);
		parames.put("m_code", m_code);
		return session.selectOne(namespace+".myGood", parames);
	}
	@Override
	public int deleteComm(int cm_code) {
		return session.delete(namespace+".deleteComm", cm_code);
	}
	@Override
	public List<RecommFollowList> getRecommFollow(int m_code) {
		return session.selectList(namespace+".RecomFollowList", m_code);
	}
}
