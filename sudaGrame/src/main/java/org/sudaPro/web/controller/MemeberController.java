package org.sudaPro.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sudaPro.web.board.service.UserRegService;

@Controller
public class MemeberController {
	@RequestMapping("editProfile")
	public String editProfile() {
		return "member.editProfile";
	}
	@RequestMapping("myPage")
	public String myPage() {
		return "member.myPage";
	}
	
	@RequestMapping("login")
	public String login() {
		return "member.login";
	}
	
	@RequestMapping("regMember")
	public String regMember() {
		return "member.regMember";
	}
	
//	@Autowired
//	private UserRegService reg_service;
	
//	@RequestMapping(value="regMemberCheck", method = {RequestMethod.POST},  produces = "application/json; charset=utf8")
//    @ResponseBody
//    public Map<Object, Object> idcheck(@RequestBody String userEmail) {
//		int count = 0;
//		Map<Object, Object> map = new HashMap<Object, Object>();
//		count = reg_service.userReg_service(userEmail);
//		System.out.println(userEmail);
//		map.put("cnt", count);
//        return map;
//    }
}
