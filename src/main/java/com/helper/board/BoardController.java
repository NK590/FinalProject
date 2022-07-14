package com.helper.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping(value="board")
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/toBoard") 	 // board페이지 요청 
	public String toBoard(Model model) throws Exception{
		List<BoardDTO> list = service.selectAll();
		model.addAttribute("list",list);
		return "/board/board";
	}
	@RequestMapping(value="/toWrite")  // write페이지 요청
	public String toWrite() {
		
		return "/board/write";
	}
	@RequestMapping(value="/summernote", produces = "text/html; charset=utf-8") // summernote 이미지 띄워주기 
	@ResponseBody
	public String summernote(@RequestParam("file") MultipartFile file)throws Exception{
		String realPath =  session.getServletContext().getRealPath("board");
		String sys_name = service.summernote(file,realPath); 
		System.out.println(sys_name);
		return sys_name;
		
	}
	@RequestMapping(value="/write") // 게시글 삽입  
	public String write(BoardDTO dto)throws Exception{		
			int rs = service.insert(dto);
			
		return "redirect:/board/toBoard";
	}
	@RequestMapping(value="/toDetail") // 상세보기 페이지
	public String toDetail(int bo_seq,Model model)throws Exception{
		BoardDTO dto = service.selectOne(bo_seq);
		model.addAttribute("dto",dto);
		return "/board/detail";
	}
	
	
	
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}












