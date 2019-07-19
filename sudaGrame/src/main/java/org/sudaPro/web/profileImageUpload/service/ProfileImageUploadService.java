package org.sudaPro.web.profileImageUpload.service;

import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.myPage.vo.MypageVO;

public interface ProfileImageUploadService {

	public int profileImageUpload(MultipartFile multipartFile, String realPath) throws Exception;

}
