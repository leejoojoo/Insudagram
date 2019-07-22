package org.sudaPro.web.submitNewProfile.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.myPage.vo.MypageVO;

@Repository
public class SubmitNewProfileDaoImpl implements SubmitNewProfileDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.SubmitNewProfileMapper";

	@Override
	public void updateMyPage(MypageVO MypageVO, int m_code) throws Exception {
		//System.out.println(m_code +"_---------------------------------------------");
		session.update(namespace+".updateMyPage", MypageVO);
		System.out.println("dao m_id :"+MypageVO.getM_code());
	}


}
