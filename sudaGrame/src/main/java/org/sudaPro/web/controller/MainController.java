package org.sudaPro.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sudaPro.web.test.dao.TestDao;

@Controller
public class MainController {
	// 테스트용 dao(마이 바티스 test)
	@Autowired
	private TestDao dao;
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("test", dao.test(3));
		return "main";
	}
	
}
