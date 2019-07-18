package org.sudaPro.web.changePassword.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.sudaPro.web.changePassword.dao.ChangePasswordDaoImpl;
import org.sudaPro.web.myPage.vo.MypageVO;

@Service
public class ChangePasswordServiceImpl implements ChangePasswordService{
	
	@Inject
	private ChangePasswordDaoImpl changepassworddao;

	@Override
	public MypageVO getMyPictureAndId(int m_code) throws Exception {
		return changepassworddao.getMyPictureAndId(m_code);
	}

}
