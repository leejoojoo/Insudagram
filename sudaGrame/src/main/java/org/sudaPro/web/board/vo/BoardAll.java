package org.sudaPro.web.board.vo;

public class BoardAll {
	private int b_code;
	private String img_img;
	private int g_cnt;
	private int cm_cnt;
	private int img_cnt;
	
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getImg_img() {
		return img_img;
	}
	public void setImg_img(String img_img) {
		this.img_img = img_img;
	}
	public int getImg_cnt() {
		return img_cnt;
	}
	public void setImg_cnt(int img_cnt) {
		this.img_cnt = img_cnt;
	}
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
}
