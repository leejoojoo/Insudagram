package org.sudaPro.web.board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sudaPro.web.board.dao.UserDaoInterface;
import org.sudaPro.web.board.vo.UserVo;

@Service
public class UserRegService{

	@Autowired
	private SqlSessionTemplate userSqlSessin;
	@Autowired
	private UserDaoInterface userDao;

	public ArrayList<Integer> userReg_service(String userEmail, String nickName) throws SQLException {
		ArrayList<Integer> al = new ArrayList<>();
		int resultCnt1 = 0;
		int resultCnt2 = 0;
		userDao = userSqlSessin.getMapper(UserDaoInterface.class);
			resultCnt1 = userDao.userNickName(nickName);
			resultCnt2 = userDao.userEmailCheck(userEmail);
			
		if (resultCnt1 == 1) { //닉네임 중복이면 1리턴
			al.add(1);
		}
		if (resultCnt2 == 1) { //아이디 중복이면 1리턴
			al.add(2);
		}
		return al;
	}
	public int insertMember(UserVo userVo) {
		int count3 = 0;
		userDao = userSqlSessin.getMapper(UserDaoInterface.class);
		try {
			count3 = userDao.insertMember(userVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count3;
	}
	public int fillHeart(int b_code) {
		int count = 0;
		userDao = userSqlSessin.getMapper(UserDaoInterface.class);
		try {
			count = userDao.fillHeart(b_code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	public int outLineHeart(int b_code) {
		int count = 0;
		userDao = userSqlSessin.getMapper(UserDaoInterface.class);
		try {
			count = userDao.outLineHeart(b_code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public UserVo getUserInfo( String principal ) {
		// System.out.println(principal);
		return this.userDao.getUser(principal);
	}

}
