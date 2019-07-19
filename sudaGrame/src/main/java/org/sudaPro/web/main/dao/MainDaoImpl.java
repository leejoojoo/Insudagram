package org.sudaPro.web.main.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.main.vo.MainAll;
import org.sudaPro.web.main.vo.MainComments;
import org.sudaPro.web.main.vo.MainImg;
import org.sudaPro.web.main.vo.MyComm;
import org.sudaPro.web.main.vo.WriteBoard;


@Repository
public class MainDaoImpl implements MainDao{
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.suda.mapper.MainMapper";
	
	@Override
	public List<MainAll> getMainAll(int m_code) {
		 System.out.println(m_code);
		return session.selectList(namespace+".mainAll",m_code);
	}
	@Override
	public List<MainComments> getMainComments(int b_code) {
		return session.selectList(namespace+".mainComments", b_code);
	}
	@Override
	public List<MainImg> getMainImg(int b_code) {
		return session.selectList(namespace+".mainImg", b_code);
	}
	@Override
	public List<MyComm> getMyComment(int b_code) {
		return session.selectList(namespace + ".myComment", b_code);
	}
	@Override
	public List<WriteBoard> getSelectEditBoard(String b_code){
		return session.selectList(namespace + ".selectEditBoard", b_code);
	};
	@Override
	public int setWriteBoard(String realPath, String[] img_img, String b_content) throws IOException{
		int result = 0;
		Map<String, Object> params = new HashMap<>();
		params.put("b_content", b_content);
		session.insert(namespace+".writeBoard", params);
		for (int i = 0; i < img_img.length; i++) {
			session.insert(namespace+".writeImg", img_img[i]);
		}
		return result;
//				selectList(namespace + ".writeBoard",saveDirectory,maxPostSize,encoding,b_content,file);
	}
	@Override
	public int setDeleteBoard(String b_code) {
		int result = 0;
		Map<String, Object> params = new HashMap<>();
		params.put("b_code", b_code);
		session.delete(namespace+".deleteBoard", params);
		return result;
	}
}
