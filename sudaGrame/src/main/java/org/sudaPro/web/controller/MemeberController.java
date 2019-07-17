package org.sudaPro.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="regMember", method=RequestMethod.GET)
	public String regMember() {
		return "member.regMember";
	}
}
