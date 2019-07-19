package org.sudaPro.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.changePassword.service.ChangePasswordService;
import org.sudaPro.web.editProfile.service.EditProfileService;
import org.sudaPro.web.myPage.service.MypageService;
import org.sudaPro.web.myPage.vo.MypageVO;
import org.sudaPro.web.profileImageUpload.service.ProfileImageUploadService;
import org.sudaPro.web.submitNewPassword.service.SubmitNewPasswordService;
import org.sudaPro.web.submitNewProfile.service.SubmitNewProfileService;

@Controller
public class MemeberController {

	@Inject
	MypageService mypageService;
	@Inject
	EditProfileService editprofileService;
	@Inject
	SubmitNewProfileService submitnewprofileService;
	@Inject
	ChangePasswordService changepasswordService;
	@Inject
	SubmitNewPasswordService submitnewpasswordService;
	@Inject
	ProfileImageUploadService profileimageuploadService;
	/*
	HttpServletRequest req;
	HttpSession session = req.getSession();
	*/
	int m_code = 1;

	//프로필사진 경로
	@Resource(name ="uploadPath")
	private String uploadPath;
	
	@RequestMapping("submitNewPassword")
	public String updateMyPassword(MypageVO mypageVO, @RequestParam("old_password") String old_password, 
			@RequestParam("new_password") String new_password, @RequestParam("m_password") String m_password) throws Exception {
		//UserVo user = (UserVo) session.getAttribute("userInfo");
		//System.out.println(user.getM_code());
		mypageVO.setM_code(m_code);
		String o_password = "hi1234";
		if (old_password.equals(o_password) && new_password.equals(m_password) && m_password != null) {
			System.out.println("o_password : "+o_password);
			System.out.println("old_password : "+old_password);
			System.out.println("new_password : "+new_password);
			System.out.println("m_password : "+m_password);
			submitnewpasswordService.updateMyPassword(mypageVO);
		}
		return "redirect:myPage";
	}

	@RequestMapping("changePassword")
	public String changePassword(Model model) throws Exception {
		MypageVO myPictureAndId = changepasswordService.getMyPictureAndId(m_code);
		model.addAttribute("myPictureAndId", myPictureAndId);

		return "member.changePassword";
	}

	@RequestMapping("submitNewProfile")
	public String submitNewProfile(MypageVO mypageVO) throws Exception {
		mypageVO.setM_code(m_code);
		submitnewprofileService.updateMyPage(mypageVO);

		return "redirect:myPage";
	}
	
//	@RequestMapping("submitNewProfile")
//	public String submitNewProfile(MypageVO mypageVO) throws Exception {
//		mypageVO.setM_code(m_code);
//		submitnewprofileService.updateMyPage(mypageVO);
//		
//		return "redirect:myPage";
//	}
	
	
	@RequestMapping("uploadProfileImage") 
	public @ResponseBody Map<String, Object> profileImageUpload(
			@RequestParam("profile") MultipartFile multipartFile, 
			HttpServletRequest request
			)                 
	          throws Exception {
		System.out.println("hii");
//		MypageVO mypageVO = new MypageVO();
		Map<String, Object> result  = new HashMap<>();
//		String realPath = request.getRealPath("/resources/img");
		System.out.println(uploadPath);
	      File saveDir = new File(uploadPath);
	      if (!saveDir.exists())
	         saveDir.mkdirs();
//		mypageVO.setM_realPath(realPath);
//		mypageVO.setM_MultipartFile(multipartFile);
	      this.profileimageuploadService.profileImageUpload(multipartFile, uploadPath);
	      result.put("result", 1111);
	      String realpath = request.getRealPath("/resources/image/");
	      
		return result;

	}

	@RequestMapping("editProfile")
	public String editProfile(Model model) throws Exception {
		MypageVO myInfo = editprofileService.getMyInfo(m_code);
		model.addAttribute("myInfo", myInfo);
		
		return "member.editProfile";
	}
	
	@RequestMapping("myPage")
	public String myPage(Model model) throws Exception {
		MypageVO IDAndProfilePicture = mypageService.getIDAndProfilePicture(m_code);
		model.addAttribute("IDAndProfilePicture", IDAndProfilePicture );
		model.addAttribute("NOP", mypageService.getNumberOfPost(m_code));
		model.addAttribute("follower", mypageService.getNumberOfFollower(m_code));
		model.addAttribute("following", mypageService.getNumberOfMyFollowing(m_code));
		List<MypageVO> imglist = mypageService.getImage(m_code);
		model.addAttribute("imglist", imglist);
		
		return "member.myPage";
	}

	@RequestMapping("findPerson")
	public String findPerson() {
		return "member.findPerson";
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
