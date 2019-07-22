package org.sudaPro.web.main.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.main.vo.MainAll;
import org.sudaPro.web.main.vo.MainComments;
import org.sudaPro.web.main.vo.MainImg;
import org.sudaPro.web.main.vo.WriteBoard;



public interface MainService {
	public List<MainAll> getMainAll(int m_code);
//	public List<MainComments> getMainComments(int b_code);
//	public List<MainImg> getMainImg(int b_code);
	public int setWriteBoard(String realPath, MultipartFile[] multipartFile, String b_content, String my_code) throws IOException;
	public int setDeleteBoard(String realPath, String b_code, String[] img_img) throws IOException;
	public List<WriteBoard> getSelectEditBoard(String b_code);
	public int setEditDeleteBoard(String realPath, String[] img_img);
	public int setSelectEditBoard(String realPath, MultipartFile[] multipartFile, String b_content, String b_code)throws IOException;

}
