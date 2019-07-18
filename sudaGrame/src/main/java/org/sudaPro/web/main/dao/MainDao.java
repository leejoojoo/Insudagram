package org.sudaPro.web.main.dao;

import java.io.IOException;
import java.util.List;

import org.sudaPro.web.main.vo.MainAll;
import org.sudaPro.web.main.vo.MainComments;
import org.sudaPro.web.main.vo.MainImg;
import org.sudaPro.web.main.vo.MyComm;
import org.sudaPro.web.main.vo.WriteBoard;

public interface MainDao {
	public List<MainAll> getMainAll(String m_id);
	public List<MainComments> getMainComments(int b_code);
	public List<MainImg> getMainImg(int b_code);
	public List<MyComm> getMyComment(int b_code);
	public int setWriteBoard(String realPath, String[] img_img, String b_content) throws IOException;
	public int setDeleteBoard(String b_code);
	public List<WriteBoard> getSelectEditBoard(String b_code);

}