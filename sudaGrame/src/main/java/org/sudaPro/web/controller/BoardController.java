package org.sudaPro.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sudaPro.web.board.service.BoardService;
import org.sudaPro.web.board.vo.BoardAll;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}


	@RequestMapping("boardAll")
	public String getboardAll(Model model) {
		model.addAttribute("board_all", this.boardService.getBoardAll("b.b_code desc"));
		return "board.boardAll";
	}
	
	@RequestMapping("boardOne")
	public String getBoardOne(int b_code, Model model) {
		model.addAttribute("board_one", this.boardService.getBoardOne(b_code));
		model.addAttribute("imges", this.boardService.getImges(b_code));
		model.addAttribute("comments", this.boardService.getComments(b_code));
		return "board.boardOne";
	}
	
}
