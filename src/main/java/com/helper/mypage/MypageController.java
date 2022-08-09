package com.helper.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.board.BoardDTO;
import com.helper.group.GroupDTO;
import com.helper.member.MemberDTO;
import com.helper.member.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@ExceptionHandler
	   public String errorerror(Exception e) {
	      System.out.println("예외 발생");
	      e.printStackTrace();
	      return "redirect:/error";
	   }
	
	//마이페이지 -> 나의 그룹 요청
	@RequestMapping(value = "/myPage") 
	public String myGroup(Model model) throws Exception{
		System.out.println("도착");
		int group_seq = ((MemberDTO)session.getAttribute("loginSession")).getGroup_seq();
		System.out.println(group_seq);
		List<GroupDTO> list = service.myGroup(group_seq);
		model.addAttribute("list", list);
		return "mypage/myGroup";
	}

	
	//마이페이지 -> 나의 커뮤니티 요청
	@RequestMapping(value = "/myBoard") 
	public String myBoard(Model model) throws Exception{	
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		System.out.println(mem_seq);
		List<BoardDTO> list = service.myBoard(mem_seq);
		System.out.println(list);
		model.addAttribute("list", list);
		System.out.println("board마이페이지 값을 보여달라");
		return "mypage/myBoard";
	}
	
	@RequestMapping(value = "/myPlanner") //마이페이지 -> 회원정보 수정 요청
	public String myPlanner() throws Exception{		
		return "mypage/myPlanner";
	}
	
	@RequestMapping(value = "/myInfo") //마이페이지 -> 회원정보 수정 요청
	public String myInfo() throws Exception{		
		return "mypage/myInfo";
	}
	
	@RequestMapping(value = "/myDropout") //마이페이지 -> 회원탈퇴 요청
	public String myDropout() throws Exception{		
		return "mypage/myDropout";
	}
	
	@RequestMapping(value = "/updateForm") // 정보 수정 요청	
	public String updateForm(MemberDTO dto) throws Exception{
		System.out.println("왔어?");
		MemberDTO ddto = (MemberDTO)session.getAttribute("loginSession");
		System.out.println(ddto);
		service.updateForm(dto);

			ddto.setMem_nick(dto.getMem_nick());
			ddto.setMem_std_key(dto.getMem_std_key());
			return "mypage/myGroup";
		
	}
	
	
	@RequestMapping(value="/dropoutForm") // 마이페이지 -> 회원 탈퇴 전 비번 확인
	@ResponseBody 
	public String dropoutForm(String mem_pw) throws Exception{
		System.out.println("왔어?");
		System.out.println(mem_pw);
		MemberDTO dto = (MemberDTO)(session.getAttribute("loginSession"));
		System.out.println("dto에 담긴거들어왔니??" + dto);
		if(passwordEncoder.matches(mem_pw, dto.getMem_pw())) {
			
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value="/dropoutConfirm") // 마이페이지 -> 회원 탈퇴
	@ResponseBody
	public String dropoutConfirm()throws Exception{
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		int rs = service.dropoutForm(mem_seq);
		
		if(rs>0) {
			return "success";
			}
		return "fail";
	}

}
