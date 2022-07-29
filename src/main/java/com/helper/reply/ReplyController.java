package com.helper.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.member.MemberDTO;

@Controller
@RequestMapping(value = "reply")
public class ReplyController {
	@Autowired
	private ReplyService service;
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/write")
	@ResponseBody
	public List<ReplyDTO> write(int bo_seq, ReplyDTO reDto) throws Exception { // 댓글 작성
		System.out.println(bo_seq + " : " + reDto.getReply_content());
		MemberDTO dto = (MemberDTO)session.getAttribute("loginSession");
		int rs = service.insert(bo_seq, reDto, dto);
		if (rs > 0) {
			return service.selectReply(bo_seq);
		}
		return null;
	}
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(int reply_seq) throws Exception{ // 댓글 삭제 
		System.out.println("삭제할 댓글 : " +reply_seq);
		int rs = service.delete(reply_seq);
			if(rs>0) {
				return "success";
			}return "fail";
	}
	@RequestMapping(value="/select")
	@ResponseBody
	public List<ReplyDTO> select(int bo_seq)throws Exception{ //댓글 조회
		System.out.println("댓글을 조회랑 게시판 : "+bo_seq);
		return service.selectReply(bo_seq);
		
	}

	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}

}











