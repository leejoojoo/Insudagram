package org.sudaPro.web.submitNewPassword.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.sudaPro.web.editProfile.dao.EditProfileDaoImpl;
import org.sudaPro.web.myPage.vo.MypageVO;
import org.sudaPro.web.submitNewPassword.dao.SubmitNewPasswordDaoImpl;
import org.sudaPro.web.submitNewProfile.dao.SubmitNewProfileDaoImpl;

@Service
public class SubmitNewPasswordServiceImpl implements SubmitNewPasswordService{
	
	@Inject
	private SubmitNewPasswordDaoImpl submitnewpassworddao ;

	@Override
	public void updateMyPassword(MypageVO MypageVO, String o_password) throws Exception {
		submitnewpassworddao.updateMyPassword(MypageVO, o_password);
	}
	
	

}
