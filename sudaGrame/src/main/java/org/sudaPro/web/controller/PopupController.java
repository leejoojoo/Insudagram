package org.sudaPro.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PopupController {
	@RequestMapping("insertMemberPopup")
	public String editProfile() {
		return "popup.insertMember";
	}
	
}
