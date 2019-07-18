package org.sudaPro.web.main.vo;

import java.util.List;

public class MainComments {
	private String cm_content;
	private String cm_id;
	private String pm_id;
	
	public String getPm_id() {
		return pm_id;
	}
	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}
	private int cm_code;
	
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_id() {
		return cm_id;
	}
	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}
	public int getCm_code() {
		return cm_code;
	}
	public void setCm_code(int cm_code) {
		this.cm_code = cm_code;
	}
}
