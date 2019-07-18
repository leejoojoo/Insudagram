package org.sudaPro.web.myPage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sudaPro.web.myPage.vo.MypageVO;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.MypageMapper";

	
	@Override
	public MypageVO getIDAndProfilePicture(int m_code) throws Exception {
		//System.out.println(m_code +"_---------------------------------------------");
		return session.selectOne(namespace+".getIDAndProfilePicture", m_code);
	}

	@Override
	public int getNumberOfPost(int m_code) throws Exception {
		return session.selectOne(namespace+".getNumberOfPost", m_code);
	}

	@Override
	public int getNumberOfFollower(int m_code) throws Exception {
		//System.out.println("follower dao : "+session.selectOne(namespace+".getNumberOfFollower", m_code));
		return session.selectOne(namespace+".getNumberOfFollower", m_code);
	}

	@Override
	public int getNumberOfMyFollowing(int m_code) throws Exception {
		//System.out.println("following dao : "+session.selectOne(namespace+".getNumberOfMyFollowing", m_code));
		return session.selectOne(namespace+".getNumberOfMyFollowing", m_code);
	}

	@Override
	public List<MypageVO> getImage(int m_code) throws Exception {
		//System.out.println("images dao : "+session.selectList(namespace+".getImage", m_code));
		return session.selectList(namespace+".getImage", m_code);
	}
	
	
	
	
}
