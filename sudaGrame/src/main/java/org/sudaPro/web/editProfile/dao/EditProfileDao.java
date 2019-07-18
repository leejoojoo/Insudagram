package org.sudaPro.web.editProfile.dao;

import org.sudaPro.web.myPage.vo.MypageVO;

public interface EditProfileDao {

	public MypageVO getMyInfo(int m_code) throws Exception;

}


