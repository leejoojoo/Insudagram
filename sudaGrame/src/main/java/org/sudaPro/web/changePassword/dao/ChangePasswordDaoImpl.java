package org.sudaPro.web.changePassword.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.myPage.vo.MypageVO;

@Repository
public class ChangePasswordDaoImpl implements ChangePasswordDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.changePasswordMapper";

	@Override
	public MypageVO getMyPictureAndId(int m_code) throws Exception {
		return session.selectOne(namespace+".getMyPictureAndId", m_code);
	}

}
