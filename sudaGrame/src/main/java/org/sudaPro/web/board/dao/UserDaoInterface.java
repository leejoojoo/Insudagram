package org.sudaPro.web.board.dao;

import java.sql.SQLException;

import org.sudaPro.web.board.vo.UserVo;


public interface UserDaoInterface {

	int userNickName(String nickName) throws SQLException;
	int userEmailCheck(String userEmail) throws SQLException;
	int insertMember(UserVo userVo) throws SQLException;
	int fillHeart(int b_code) throws SQLException;
	int outLineHeart(int b_code) throws SQLException;
	public UserVo getUser(String principal);
//	int checkOverId(String userEmail);


}
