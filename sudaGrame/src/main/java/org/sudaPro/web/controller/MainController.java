package org.sudaPro.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sudaPro.web.board.service.BoardService;
import org.sudaPro.web.board.service.UserRegService;
import org.sudaPro.web.board.vo.UserVo;
import org.sudaPro.web.test.dao.TestDao;
import org.sudaPro.web.main.service.MainService;
import org.sudaPro.web.myPage.vo.MypageVO;

import com.sun.security.auth.UserPrincipal;

@Controller
public class MainController {
	@Autowired
	private TestDao dao;
	
	@Autowired
	private UserRegService service;

	@Autowired
	private MainService mainService;
	
	public void setDao(TestDao dao) {
		this.dao = dao;
	}


	public void setService(UserRegService service) {
		this.service = service;
	}
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	
	@RequestMapping("/")
	public String main(Model model,HttpSession session, HttpServletRequest request) {
	if (request.getUserPrincipal().getName() != null) {// 로그인 한 상태면 
			session.setAttribute("userInfo", this.service.getUserInfo(request.getUserPrincipal().getName()));
		//	model.addAttribute("test", dao.test(3));
			
			
		/*	UserVo user = (UserVo)session.getAttribute("userInfo");
			System.out.println("!!!!!!"+user.getM_code());
			String m_code = user.getM_code();
			model.addAttribute("main_all", this.mainService.getMainAll(m_code));*/
			
			return "redirect:main2";
			
		}else {
			return "member.login";
		}
	}
		//return "main";
	
	@RequestMapping("main2")
	public String getmainAll(Model model,HttpSession session, HttpServletRequest request) {
		
		UserVo user = (UserVo)session.getAttribute("userInfo");
		System.out.println("akfajfljf;lajfa;fj;af"+user.getNickName());
		System.out.println(user.getM_code());
		int m_code = user.getM_code();
		String nickName = user.getNickName();
//		MypageVO IDAndProfilePicture = mypageService.getIDAndProfilePicture(m_code);
		model.addAttribute("my_code", user.getM_code() );
		model.addAttribute("nickName", user.getNickName() );
		model.addAttribute("main_all", this.mainService.getMainAll(m_code));
		return "main";
	}

	
}
