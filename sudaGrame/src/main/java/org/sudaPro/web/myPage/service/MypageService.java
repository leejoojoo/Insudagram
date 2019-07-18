package org.sudaPro.web.myPage.service;

import java.util.List;

import org.sudaPro.web.myPage.vo.MypageVO;

public interface MypageService {

	public MypageVO getIDAndProfilePicture(int m_code) throws Exception;

	public int getNumberOfPost(int m_code) throws Exception;
	
	public int getNumberOfFollower(int m_code) throws Exception;
	
	public int getNumberOfMyFollowing(int m_code) throws Exception;
	
	public List<MypageVO> getImage(int m_code) throws Exception;
	
}
