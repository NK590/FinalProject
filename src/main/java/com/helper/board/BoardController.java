package com.helper.board;

import java.util.ArrayList;
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
import com.helper.reply.ReplyDTO;
import com.helper.reply.ReplyService;

@RequestMapping(value="/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/toBoard") 	 // board페이지 요청  // 게시글 전체 조회
	public String toBoard(Model model,@RequestParam(value="curPage", defaultValue = "1")int curPage) throws Exception{
		
		// 게시글 총 개수
		int listCount = service.getListCnt();
		// 클릭한 페이지, 총 게시글 수 전달
		BoardPagingDTO bpd = BoardPagination.getPageInfo(curPage, listCount);
		System.out.println(curPage +" : "+listCount);
		//  게시글 목록
		List<BoardDTO> list = service.selectAll((curPage*10)-9,curPage*10);
		
		model.addAttribute("naviMap",bpd);
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
		List<ReplyDTO> list = replyService.selectReply(bo_seq);  // 해당 페이지의 댓글 불러오기 
		model.addAttribute("list",list);
		
		return "/board/detail";
	}
	@RequestMapping(value="/delete") // 이미지가 있는 게시글 삭제
	@ResponseBody
	public String delete(@RequestParam(value="arr[]")List<String>img_arr,@RequestParam(value="bo_seq")int bo_seq)throws Exception{
		String realPath = session.getServletContext().getRealPath("board");
		int rs = service.delete(bo_seq, img_arr,realPath);
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@RequestMapping(value="/delete2") // 이미지가 없는 게시글 삭제
	@ResponseBody
	public String delete2(int bo_seq)throws Exception{
		int rs = service.delete2(bo_seq);
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@RequestMapping(value="/update") // 게시글 수정
	public String update(@RequestParam(value="arr[]")List<String>updateFile, BoardDTO dto)throws Exception{
		System.out.println(dto.toString());
		List<String> list= new ArrayList<>();
		for(String file:updateFile) {
			String pattern = "/images.*"; // 패턴   
			String img = file.replaceAll(".*/board/", "");  // 대상 문자열 제거 
			list.add(img);
		}
		System.out.println(list);
		
		String realPath = session.getServletContext().getRealPath("board");
		int rs = service.update(list,dto,realPath);
		return "redirect:/board/toDetail?bo_seq="+dto.getBo_seq();
	}
	@RequestMapping(value="/search") // 게시글 검색
	@ResponseBody
	public List<BoardDTO> search(String category, String keyword, @RequestParam(value="curPage", defaultValue = "1")int curPage)throws Exception{
		System.out.println(category+" : "+keyword + " : "+curPage);
		// 검색한 게시글의 리스트
		List<BoardDTO> list = service.search(category,keyword,(curPage*10)-9,curPage*10);
		
		
		// 검색한 게시글의 개수
		int listCount = service.searchPaging(category, keyword);
		BoardPagingDTO bpd = BoardPagination.getPageInfo(curPage, listCount);
		
		System.out.println(list);
		return list;
	}
	@RequestMapping(value="/imgDelete") // summernote에서 img를 지웠을때 
	@ResponseBody
	public String imgDelete(String path)throws Exception{
		String realPath =  session.getServletContext().getRealPath("board");
		System.out.println(path);// 대상 문자열
		String pattern = "/images.*"; // 패턴   
		String img = path.replaceAll(".*/board/", "");  // 대상 문자열 제거 
		service.imgDelete(img,realPath);
		
		return"a image is deleted";
	}
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}












