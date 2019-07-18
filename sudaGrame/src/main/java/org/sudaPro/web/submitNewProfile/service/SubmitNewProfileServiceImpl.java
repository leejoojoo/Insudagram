package org.sudaPro.web.submitNewProfile.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.sudaPro.web.editProfile.dao.EditProfileDaoImpl;
import org.sudaPro.web.myPage.vo.MypageVO;
import org.sudaPro.web.submitNewProfile.dao.SubmitNewProfileDaoImpl;

@Service
public class SubmitNewProfileServiceImpl implements SubmitNewProfileService{
	
	@Inject
	private SubmitNewProfileDaoImpl submitnewprofiledao ;

	@Override
	public void updateMyPage(MypageVO MypageVO) throws Exception {
		submitnewprofiledao.updateMyPage(MypageVO);
		System.out.println("service m_id : "+MypageVO.getM_id());
	}

}
