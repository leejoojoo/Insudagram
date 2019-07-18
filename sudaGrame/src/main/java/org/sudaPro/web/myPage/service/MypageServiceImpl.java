package org.sudaPro.web.myPage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.sudaPro.web.myPage.dao.MypageDaoImpl;
import org.sudaPro.web.myPage.vo.MypageVO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Inject
	private MypageDaoImpl mypagedao;

	@Override
	public MypageVO getIDAndProfilePicture(int m_code) throws Exception {
		return mypagedao.getIDAndProfilePicture(m_code);
	}

	@Override
	public int getNumberOfPost(int m_code) throws Exception {
		return mypagedao.getNumberOfPost(m_code);
	}

	@Override
	public int getNumberOfFollower(int m_code) throws Exception {
		//System.out.println("follower service : "+mypagedao.getNumberOfFollower(m_code));
		return mypagedao.getNumberOfFollower(m_code);
	}

	@Override
	public int getNumberOfMyFollowing(int m_code2) throws Exception {
		//System.out.println("following service : "+mypagedao.getNumberOfMyFollowing(m_code2));
		return mypagedao.getNumberOfMyFollowing(m_code2);
	}

	@Override
	public List<MypageVO> getImage(int m_code) throws Exception {
		//System.out.println("images service : "+mypagedao.getImage(m_code));
		return mypagedao.getImage(m_code);
	}


		
}
