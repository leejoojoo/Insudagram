package org.sudaPro.web.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.sudaPro.web.changePassword.service.ChangePasswordService;
import org.sudaPro.web.editProfile.service.EditProfileService;
import org.sudaPro.web.myPage.service.MypageService;
import org.sudaPro.web.myPage.vo.MypageVO;
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


	int m_code = 1;

	@RequestMapping("submitNewPassword")
	public String updateMyPassword(MypageVO mypageVO, @RequestParam String old_password, @RequestParam String new_password, @RequestParam String m_password) throws Exception {
		mypageVO.setM_code(m_code);
		String o_password = mypageVO.getM_password();
		if (old_password.equals(o_password) && new_password.equals(m_password) && m_password != null) {
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

	@RequestMapping(value="regMember", method=RequestMethod.GET)
	public String regMember() {
		return "member.regMember";
	}
}
