package org.sudaPro.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.sudaPro.web.board.service.UserRegService;
import org.sudaPro.web.board.vo.UserVo;

@RestController
public class MemberAjaxController {
	
	@Autowired
	private UserRegService reg_service;
	public void setRegService(UserRegService reg_service) {
		this.reg_service = reg_service;
	}
	@RequestMapping("regMemberCheck")
	 public ArrayList<Integer> idcheck(String userEmail, String nickName) throws SQLException {
		ArrayList<Integer> al = new ArrayList<>();
		al = reg_service.userReg_service(userEmail, nickName);
        return al;
    }
	
	@RequestMapping(value ="insertMember", method = RequestMethod.POST)
	public int idcheck(@ModelAttribute UserVo userVo) {
		int data1 = 0;
		data1 = reg_service.insertMember(userVo);
		return data1;
	}
	
	@RequestMapping(value ="fillHeart", method = RequestMethod.POST)
	public int fillHeart(int b_code) {
		int data = 0;
		data = reg_service.fillHeart(b_code);
		System.out.println("좋아요추가"+data);
		return data;
	}
	
	@RequestMapping(value ="outLineHeart", method = RequestMethod.POST)
	public int outLineHeart(int b_code) {
		int data = 0;
		data = reg_service.outLineHeart(b_code);
		System.out.println("좋아요삭제"+data);
		return data;
	}

}
