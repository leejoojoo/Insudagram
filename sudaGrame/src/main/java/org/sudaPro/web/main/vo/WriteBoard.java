package org.sudaPro.web.main.vo;

import java.util.Date;
import java.util.List;

public class WriteBoard {
	private String b_content;
	private int m_code;
	private int b_code;
	private List<MainImg> mainImg;
	
	
	public List<MainImg> getMainImg() {
		return mainImg;
	}
	public void setMainImg(List<MainImg> mainImg) {
		this.mainImg = mainImg;
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
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

}
