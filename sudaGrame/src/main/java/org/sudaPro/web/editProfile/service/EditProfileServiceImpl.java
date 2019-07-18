package org.sudaPro.web.editProfile.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.sudaPro.web.editProfile.dao.EditProfileDaoImpl;
import org.sudaPro.web.myPage.vo.MypageVO;

@Service
public class EditProfileServiceImpl implements EditProfileService{
	
	@Inject
	private EditProfileDaoImpl editprofiledao;
	
	
	@Override
	public MypageVO getMyInfo(int m_code) throws Exception {
		
		return editprofiledao.getMyInfo(m_code);
	}

}
