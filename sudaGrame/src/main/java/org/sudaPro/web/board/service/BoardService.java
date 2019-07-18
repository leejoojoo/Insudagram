package org.sudaPro.web.board.service;

import java.util.List;

import org.sudaPro.web.board.vo.BoardAll;
import org.sudaPro.web.board.vo.BoardOne;
import org.sudaPro.web.board.vo.ChildComm;
import org.sudaPro.web.board.vo.Comments;
import org.sudaPro.web.board.vo.Gooder;


public interface BoardService {
	public List<BoardAll> getBoardAll(String sort);
	public BoardOne getBoardOne(int b_code);
	public List<Comments> getComments(int b_code);
	public List<String> getImges(int b_code);
	public List<ChildComm> getChildComments(int cm_group);
	public int insertComm(String content, int cm_group, int b_code, int m_code, String pm_id);
	public List<Gooder> getGoodList(int b_code);
	
}
