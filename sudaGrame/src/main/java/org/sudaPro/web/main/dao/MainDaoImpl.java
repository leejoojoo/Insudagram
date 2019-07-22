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
	public int setWriteBoard(String realPath, String[] img_img, String b_content, String my_code) throws IOException{
		int result = 0;
		Map<String, Object> params = new HashMap<>();
		params.put("b_content", b_content);
		params.put("my_code", my_code);
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
	@Override
	public int setEditDeleteBoard(String[] img_img) {
		int result = 0;
		for (int i = 0; i < img_img.length; i++) {
			session.delete(namespace+".editDeleteBoard", img_img[i]);
		}
		return result;
	}
	@Override
	public int setSelectEditBoard(String realPath, String[] img_img, String b_content,String b_code) throws IOException {
		int result = 0;
		System.out.println("dao       "+b_code);
		Map<String, Object> params = new HashMap<>();
		params.put("b_code", b_code);
		params.put("b_content", b_content);
		session.update(namespace+".editBoard", params);
		
		Map<String, Object> param = new HashMap<>();
		for (int i = 0; i < img_img.length; i++) {
			param.put("b_code", b_code);
			param.put("img_img", img_img[i]);
			session.insert(namespace+".editImg", param);
		}
		return result;
	}
}
