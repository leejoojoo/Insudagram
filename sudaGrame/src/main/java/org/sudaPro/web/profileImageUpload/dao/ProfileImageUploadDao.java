package org.sudaPro.web.profileImageUpload.dao;

import org.sudaPro.web.myPage.vo.MypageVO;

public interface ProfileImageUploadDao {

//	public void profileImageUpload(MypageVO MypageVO) throws Exception;
	public int profileImageUpload(String originName, int m_code) throws Exception;
	
}


