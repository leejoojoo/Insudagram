package org.sudaPro.web.main.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.main.dao.MainDao;
import org.sudaPro.web.main.vo.MainAll;
import org.sudaPro.web.main.vo.MainComments;
import org.sudaPro.web.main.vo.MainImg;
import org.sudaPro.web.main.vo.WriteBoard;
import org.sudaPro.web.main.vo.WriteImg;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainDao mainDao;
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
	@Override
	public List<MainAll> getMainAll(int m_code) {
		List<MainAll>buffer = this.mainDao.getMainAll(m_code);
		List<MainAll>list = new ArrayList<>();
		for (int i = 0; i < buffer.size(); i++) {
			System.out.println("service hiiiiiiiiiiiiiiii");
			MainAll main = buffer.get(i);
			main.setMainComments( this.mainDao.getMainComments(main.getB_code()));
			main.setMyComment(this.mainDao.getMyComment(main.getB_code()));
			main.setMainImg(this.mainDao.getMainImg(main.getB_code()));
			list.add(main);
			System.out.println(this.mainDao.getMainComments(main.getB_code()));
		}
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<WriteBoard> getSelectEditBoard(String b_code) {
		List<WriteBoard>buffer = this.mainDao.getSelectEditBoard(b_code);
		List<WriteBoard>list = new ArrayList<>();
		for (int i = 0; i < buffer.size(); i++) {
			WriteBoard writeBoard = buffer.get(i);
			writeBoard.setMainImg( this.mainDao.getMainImg(writeBoard.getB_code()));

			list.add(writeBoard);
			System.out.println("editboard hiiiiiiiiiiiiiiiiiii"+this.mainDao.getMainImg(writeBoard.getB_code()));
		}
		System.out.println(list);
		return list;
	}


	@Override
	public int setWriteBoard(String realPath, MultipartFile[] multipartFile, String b_content, String my_code) throws IOException{
		
		String originName[] = new String[multipartFile.length];
		System.out.println(realPath);
		for (int i = 0; i < multipartFile.length; i++) {
			originName[i] = multipartFile[i].getOriginalFilename();
			byte[]bytes=multipartFile[i].getBytes();
			File files = new File(realPath,originName[i]);
			FileCopyUtils.copy(bytes, files);
		}
		return this.mainDao.setWriteBoard(realPath,originName,b_content, my_code);
	}

	public int setDeleteBoard(String realPath, String b_code, String[] img_img) throws IOException {
		System.out.println("service hiiiiiiii");
		System.out.println(realPath);
		String originName[] = new String[img_img.length];
		for (int i = 0; i < img_img.length; i++) {
			System.out.println("aaaaaaaaaaa"+i);
			originName[i] = img_img[i];
			File files = new File(realPath,originName[i]);
			files.delete();
		}
		return this.mainDao.setDeleteBoard(b_code);
	}

	@Override
	public int setEditDeleteBoard(String realPath, String[] img_img) {
		System.out.println("service ii");
		System.out.println(realPath);
		String originName[] = new String[img_img.length];
		for (int i = 0; i < img_img.length; i++) {
			System.out.println("aaaaaaaaaaa"+i);
			originName[i] = img_img[i];
			File files = new File(realPath,originName[i]);
			files.delete();
		}
		return this.mainDao.setEditDeleteBoard(img_img);
	}

	@Override
	public int setSelectEditBoard(String realPath, MultipartFile[] multipartFile, String b_content, String b_code) throws IOException {
		
		String originName[] = new String[multipartFile.length];
		System.out.println(realPath);
		System.out.println("service     "+b_code);
		for (int i = 0; i < multipartFile.length; i++) {
			originName[i] = multipartFile[i].getOriginalFilename();
			byte[]bytes=multipartFile[i].getBytes();
			File files = new File(realPath,originName[i]);
			FileCopyUtils.copy(bytes, files);
		}
		return this.mainDao.setSelectEditBoard(realPath,originName,b_content,b_code);
	}

	
}
