package org.sudaPro.web.profileImageUpload.dao;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.myPage.vo.MypageVO;

@Repository
public class ProfileImageUploadDaoImpl implements ProfileImageUploadDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.profileImageUploadMapper";

//	@Override
//	public void profileImageUpload(MypageVO MypageVO) throws Exception {
//		System.out.println("_---------------------------------------------");
//		session.update(namespace+".profileImageUpload", MypageVO);
//	}

	@Override
	public int profileImageUpload(String originName, int m_code) {
		System.out.println("업로드이미지 dao : "+m_code);
//		String result = "success";
		int result = 0;
	    Map<String, Object> params = new HashMap<>();
	    params.put("originName", originName);
	    params.put("m_code", m_code);
		session.update(namespace+".profileImageUpload", params);
		return result;
	}


}
