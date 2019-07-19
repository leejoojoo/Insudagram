package org.sudaPro.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.sudaPro.web.main.service.MainService;
import org.sudaPro.web.main.vo.WriteBoard;



@RestController
public class MainAjaxController {
	@Autowired
	private MainService mainService;
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@Autowired
	ServletContext c;
	private String realPath;
	
	@PostConstruct
	public void initController() {
		this.realPath = c.getRealPath("/resources/image");
	}
   
	public void renameFile(String filename, String newFilename) {
	    File file = new File( filename );
	    File fileNew = new File( newFilename );
	    if( file.exists() ) file.renameTo( fileNew );
	}
	
	@RequestMapping(value="selectEditBoard", method=RequestMethod.GET)
	public List<WriteBoard> getSelectEditBoard(@RequestParam String b_code, Model model, HttpServletRequest request) {
		System.out.println("hi");
		System.out.println(b_code);
		return this.mainService.getSelectEditBoard(b_code);
	}
	
	@RequestMapping(value="deleteBoard", method=RequestMethod.POST)
	public int setDeleteBoard(@RequestParam("b_code") String b_code, @RequestParam("deleteGallery") String[] img_img, HttpServletRequest request) throws IOException {
		System.out.println("hi");
		System.out.println(b_code);
		System.out.println(realPath);
//		realPath += "/resources/image";
		return this.mainService.setDeleteBoard(realPath,b_code,img_img);
	}
	
	@RequestMapping(value="writeBoard", method=RequestMethod.POST)
	public int setWriteBoard(@RequestParam("b_content") String b_content, @RequestParam("writeGallery") MultipartFile[] multipartFile, HttpServletRequest request) throws IOException {
		System.out.println("hi");
//		realPath += "/resources/image";
		System.out.println(realPath);
		File saveDir = new File(realPath);
		if (!saveDir.exists())
			saveDir.mkdirs();
		
//		String saveDirectory = "C:\Users\SIST167\git\SudaGram\sudaGrame\src\main\webapp\resources\img";
//		String realPath = request.getRealPath("/resources/image");
		
//		WriteBoard writeBoard = new WriteBoard();
//		writeBoard.setB_content(b_content);
//		writeBoard.setM_code(1);
		
//		List<MultipartFile>file = request.getFiles("picture");
//		System.out.println(b_content);
		
		return this.mainService.setWriteBoard(realPath,multipartFile, b_content);
	}
	
	
	
}
