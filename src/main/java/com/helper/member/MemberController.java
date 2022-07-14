package com.helper.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	
//	@RequestMapping(value = "/login") //로그인 요청
//	public String login(String mem_id, String mem_pw) throws Exception{
//		System.out.println(mem_id + " : " + mem_pw); //null,null뜨니까 loginOK dao 만들기
//		MemberDTO dto = service.login(mem_id, mem_pw);
//		if(dto != null) {
//			session.setAttribute("loginSession", dto);
//			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
//			return "success";
//		}
//		return "fail";
//	}
	
	@RequestMapping(value = "/login") //로그인 페이지 요청
	public String login() throws Exception{
		return "member/login";
	}
	
	@RequestMapping(value = "/signup") //회원가입 페이지 요청
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping(value = "/popup") //팝업 페이지 요청
	public String popup() {
		return "member/popup";
	}
	
	@RequestMapping(value = "/checkEmailForm")  // 이메일 중복확인 요청
	public String checkEmailForm(String mem_id, Model model) throws Exception{
		System.out.println(mem_id);
		MemberDTO dto = null;
		dto = service.checkEmail(mem_id);
		if(dto != null) {
			model.addAttribute("rs", "no");
		} else {
			model.addAttribute("rs", "ok");
			model.addAttribute("mem_id", mem_id);
		}
		return "member/popup";
	}
	
	@RequestMapping(value = "/signupForm") // 회원가입 요청
	public String signupForm(MemberDTO dto) throws Exception{
		System.out.println(dto.toString());
		service.insert(dto);
		return "member/login";
	}
	
	@RequestMapping(value = "/loginForm") //로그인 요청
	public String loginForm(String mem_id, String mem_pw) throws Exception{
		System.out.println(mem_id + " : " + mem_pw);
		service.loginOk(mem_id, mem_pw);
		return "/home";
	}
	
	
	/*
	@ExceptionHandler
	public String toError(Exception e) {// 에러페이지로 이동
		System.out.println("에러 발생");
		e.printStackTrace();
		return "redirect:/toError"; // home에다가 만들지 어디에만들지 나중에~~
	}
	*/
}
