package org.sudaPro.web.main.vo;

import java.util.Date;
import java.util.List;

public class MainAll {
	private int b_code;
	private String b_content;
	private Date b_regdate;
//	private String img_img;
	private int g_cnt;
	private int cm_cnt;
	private int img_cnt;
	private String m_id;
	private String m_picture;
//	private String m_name;
	private List<MainComments> mainComments;
	private List<MyComm> myComment;
	private List<MainImg> mainImg;
	
	public List<MainImg> getMainImg() {
		return mainImg;
	}
	public void setMainImg(List<MainImg> mainImg) {
		this.mainImg = mainImg;
	}
	public List<MyComm> getMyComment() {
		return myComment;
	}
	public void setMyComment(List<MyComm> myComment) {
		this.myComment = myComment;
	}
	public List<MainComments> getMainComments() {
		return mainComments;
	}
	public void setMainComments(List<MainComments> mainComments) {
		this.mainComments = mainComments;
	}
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
//	public String getImg_img() {
//		return img_img;
//	}
//	public void setImg_img(String img_img) {
//		this.img_img = img_img;
//	}
	public int getG_cnt() {
		return g_cnt;
	}
	public void setG_cnt(int g_cnt) {
		this.g_cnt = g_cnt;
	}
	public int getCm_cnt() {
		return cm_cnt;
	}
	public void setCm_cnt(int cm_cnt) {
		this.cm_cnt = cm_cnt;
	}
	public int getImg_cnt() {
		return img_cnt;
	}
	public void setImg_cnt(int img_cnt) {
		this.img_cnt = img_cnt;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
//	public String getM_name() {
//		return m_name;
//	}
//	public void setM_name(String m_name) {
//		this.m_name = m_name;
//	}
	public String getM_picture() {
		return m_picture;
	}
	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}
	

}
