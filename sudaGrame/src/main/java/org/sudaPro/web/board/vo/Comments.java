package org.sudaPro.web.board.vo;

import java.util.Date;
import java.util.List;

public class Comments {
	private String cm_content;
	private Date cm_date;
	private String m_id;
	private int cm_code;
	private int cnt_child;
	private String pm_id;
	private String m_picture;
	
	public String getM_picture() {
		return m_picture;
	}
	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}
	public String getPm_id() {
		return pm_id;
	}
	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}
	public int getCnt_child() {
		return cnt_child;
	}
	public void setCnt_child(int cnt_child) {
		this.cnt_child = cnt_child;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public Date getCm_date() {
		return cm_date;
	}
	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getCm_code() {
		return cm_code;
	}
	public void setCm_code(int cm_code) {
		this.cm_code = cm_code;
	}
}
