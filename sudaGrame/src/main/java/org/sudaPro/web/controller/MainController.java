package org.sudaPro.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sudaPro.web.board.service.BoardService;
import org.sudaPro.web.board.service.UserRegService;
import org.sudaPro.web.test.dao.TestDao;

import com.sun.security.auth.UserPrincipal;

@Controller
public class MainController {
	@Autowired
	private TestDao dao;
	
	@Autowired
	private UserRegService service;
	
	
	public void setDao(TestDao dao) {
		this.dao = dao;
	}


	public void setService(UserRegService service) {
		this.service = service;
	}


	@RequestMapping("/")
	public String main(Model model,HttpSession session, HttpServletRequest request) {
	//	public String main(Model model, com.sun.security.auth.UserPrincipal) {
		// System.out.println("asd!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + request.getUserPrincipal().getName());
		// System.out.println("name" + principal.getName());
		if (request.getUserPrincipal().getName() != null) {// 로그인 한 상태면 
			session.setAttribute("userInfo", this.service.getUserInfo(request.getUserPrincipal().getName()));
			model.addAttribute("test", dao.test(3));
			return "main";
			
		}else {
			return "member.login";
		}
		
		//return "main";
	}
	
}
