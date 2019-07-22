package org.sudaPro.web.submitNewPassword.dao;

import org.sudaPro.web.myPage.vo.MypageVO;

public interface SubmitNewPasswordDao {

	public void updateMyPassword(MypageVO MypageVO, String o_password) throws Exception;
	
}


