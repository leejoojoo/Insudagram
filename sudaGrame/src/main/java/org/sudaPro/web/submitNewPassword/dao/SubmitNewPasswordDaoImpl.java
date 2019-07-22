package org.sudaPro.web.submitNewPassword.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.myPage.vo.MypageVO;

@Repository
public class SubmitNewPasswordDaoImpl implements SubmitNewPasswordDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.SubmitNewPasswordMapper";

	@Override
	public void updateMyPassword(MypageVO MypageVO, String o_password) throws Exception {
		session.update(namespace+".updateMyPassword", MypageVO);
	}

	

}
