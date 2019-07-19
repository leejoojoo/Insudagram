package org.sudaPro.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sudaPro.web.main.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	
	@RequestMapping("/")
	public String getmainAll(Model model) {
		model.addAttribute("main_all", this.mainService.getMainAll(null));
		return "main";
	}
	
	
}
