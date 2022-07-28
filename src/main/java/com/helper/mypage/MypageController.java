package com.helper.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/myGroup") //마이페이지 -> 나의 그룹 요청
	public String myGroup(Model model) throws Exception{
//		int group_seq = ((GroupDTO)session.getAttribute("loginSession")).getGroup_seq();
//		ArrayList<GroupDTO> list = service.myGroup(group_seq);
//		model.addAttribute("list", list);
		
		return "mypage/myGroup";
	}
	
	@RequestMapping(value = "/myBoard") //마이페이지 -> 내가 쓴 문의 요청
	public String myBoard(Model model) throws Exception{	
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		
		ArrayList<BoardDTO> list = service.myBoard(mem_seq);
		model.addAttribute("list", list);
		
		return "mypage/myBoard";
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
		String encodePassword = passwordEncoder.encode(dto.getMem_pw());
		dto.setMem_pw(encodePassword);
		session.setAttribute("loginSession", dto);
		service.updateForm(dto);

		return "mypage/myGroup";
	}
	
	
	@RequestMapping(value="/dropoutForm") // 마이페이지 -> 회원 탈퇴
	@ResponseBody 
	public String dropoutForm(String mem_pw) throws Exception{
		System.out.println("왔어?");
		MemberDTO dto = (MemberDTO)(session.getAttribute("loginSession"));
		if(passwordEncoder.matches(mem_pw, dto.getMem_pw())) {
			service.dropoutForm(dto);
			session.removeAttribute("loginSession");
			System.out.println("넘어왔니?");
			
			return "success";
		}
		return "fail";
	}


}
