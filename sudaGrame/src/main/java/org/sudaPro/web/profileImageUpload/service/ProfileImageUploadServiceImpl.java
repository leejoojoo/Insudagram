package org.sudaPro.web.profileImageUpload.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.myPage.vo.MypageVO;
import org.sudaPro.web.profileImageUpload.dao.ProfileImageUploadDaoImpl;

@Service
public class ProfileImageUploadServiceImpl implements ProfileImageUploadService{
	
	@Inject
	private ProfileImageUploadDaoImpl profileimageuploaddao ;

//	@Override
//	public void profileImageUpload(@RequestParam(value="image", required=false) MultipartFile multipartFile, MypageVO MypageVO) throws Exception {
//		MultipartFile m_MultipartFile = MypageVO.getM_MultipartFile();
//	      try {
//	               String uuidname = UUID.randomUUID().toString()+".jpg";
//	               byte[] bytes = m_MultipartFile.getBytes();
//	               File file = new File(MypageVO.getM_realPath(), uuidname);
//	               FileCopyUtils.copy(bytes, file);
//	               MypageVO.setM_picture(uuidname);
//	         } 
//	         catch (IOException e) {
//	               // TODO Auto-generated catch block
//	               e.printStackTrace();
//	         }
//
//		profileimageuploaddao.profileImageUpload(MypageVO);
//	}

	@Override
	public int profileImageUpload(MultipartFile multipartFile, String realPath) throws Exception {
			System.out.println(realPath);
			String originName = multipartFile.getOriginalFilename();
			System.out.println(originName);
			byte[]bytes=multipartFile.getBytes();
			File files = new File(realPath,originName);
			FileCopyUtils.copy(bytes, files);
			
			return this.profileimageuploaddao.profileImageUpload(originName);
	}

}
