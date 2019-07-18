package org.sudaPro.web.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sudaPro.web.board.dao.BoardDao;
import org.sudaPro.web.board.vo.BoardAll;
import org.sudaPro.web.board.vo.BoardOne;
import org.sudaPro.web.board.vo.ChildComm;
import org.sudaPro.web.board.vo.Comments;
import org.sudaPro.web.board.vo.Gooder;
import org.sudaPro.web.board.vo.RecommFollowList;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@Override
	public List<BoardAll> getBoardAll(String sort) {
		return this.boardDao.getBoardAll(sort);
	}
	@Override
	public BoardOne getBoardOne(int b_code, int m_code) {
		BoardOne boardOne =  this.boardDao.getBoardOne(b_code);
		boardOne.setM_g(this.boardDao.myGood(b_code, m_code));
		return boardOne;
	}
	@Override
	public List<Comments> getComments(int b_code) {
		List<Comments> buffer = this.boardDao.getComments(b_code);
		List<Comments> list = new ArrayList<Comments>();
		
		for (int i = 0; i < buffer.size(); i++) {
			Comments comm = buffer.get(i);
			int childCnt = this.boardDao.getChildCnt(b_code, comm.getCm_code());
			comm.setCnt_child(childCnt);
			list.add(comm);
			// System.out.println("cm_code : "+comm.getCm_code());
		}
		return buffer;
	}
	@Override
	public List<String> getImges(int b_code) {
		return this.boardDao.getImges(b_code);
	}

	@Override
	public List<ChildComm> getChildComments(int cm_group) {
		return this.boardDao.getChildComm(cm_group);
	}

	@Override
	public int insertComm(String content, int cm_group, int b_code, int m_code, String pm_id) {
		return this.boardDao.insertComm(content, cm_group, b_code, m_code, pm_id);
	}

	@Override
	public List<Gooder> getGoodList(int b_code) {
		return this.boardDao.getGoodList(b_code);
	}

	@Override
	public int deleteComm(int cm_code) {
		return this.boardDao.deleteComm(cm_code);
	}

	@Override
	public List<RecommFollowList> getRecommFollow(int m_code) {
		return this.boardDao.getRecommFollow(m_code);
	}
	
}
