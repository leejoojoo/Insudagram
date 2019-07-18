package org.sudaPro.web.editProfile.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.myPage.vo.MypageVO;

@Repository
public class EditProfileDaoImpl implements EditProfileDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.EditProfileMapper";

	
	@Override
	public MypageVO getMyInfo(int m_code) throws Exception {
		return session.selectOne(namespace+".getMyInfo", m_code);
	}

}
