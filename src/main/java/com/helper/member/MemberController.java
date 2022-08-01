package com.helper.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value = "/login") //로그인 페이지 요청
	public String login() throws Exception{		
		return "member/login";
	}
	
	@RequestMapping(value = "/signup") //회원가입 페이지 요청
	public String toSignup() {
		return "member/signup";
	}
	
	@RequestMapping(value = "/popup") //팝업 페이지 요청
	public String popup() {
		return "member/popup";
	}
	
	// 이메일 찾기
	@RequestMapping(value = "/searchId") 
	public String searchId() {
		return "member/idSearch";
	}
	
	// 이메일 찾기
	@RequestMapping(value = "/findNick")
	@ResponseBody
	public String findNick(String mem_nick) throws Exception{
		System.out.println(mem_nick);
		MemberDTO dto = null;
		dto = service.findNickname(mem_nick);
		if(dto != null) {
			String mem_id = dto.getMem_id();
			return mem_id;
			
		} else {
			
			return "no";
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/searchPw") 
	public String searchPw() {
		return "member/passwordSearch";
	}
	
	// 비밀번호 찾기
		
		@ResponseBody
		@RequestMapping(value = "/findPassword")
		public String pwUpdate(MemberDTO dto)throws Exception{
			String encodePassword = passwordEncoder.encode(dto.getMem_pw());
			dto.setMem_pw(encodePassword);
			service.findPasswordForm(dto);
			
			return "member/findPassword";
		}
	
	// 이메일 중복확인 요청
	@RequestMapping(value = "/checkEmailForm")
	@ResponseBody
	public String checkEmailForm(String mem_id) throws Exception{
		System.out.println(mem_id);
		MemberDTO dto = null;
		dto = service.checkEmail(mem_id);
		if(dto != null) {
			
			return "no";
			
		} else {
			return "ok";
		}
	}
	
	// 이메일 인증번호 발송
	@RequestMapping(value = "/certificationEmail")
	@ResponseBody
	public int certificationEmail(String mem_id) throws Exception{
		System.out.println("id : "+ mem_id);
		System.out.println("왔어?");
		SendMail sm = new SendMail();
		int randomNumber = sm.compare(mem_id);
		System.out.println("randomNumber : " + randomNumber);
		
		return randomNumber;
	}
	
	
	@RequestMapping(value = "/signupForm") // 회원가입 요청
	public String signupForm(MemberDTO dto, HttpSession session) throws Exception{
		if(dto.getMem_pw() != null) {
			System.out.println(dto.toString());
			String encodePassword = passwordEncoder.encode(dto.getMem_pw());
			dto.setMem_pw(encodePassword); 
			System.out.println("encodePassword : " + encodePassword);
		}else {
			dto.setMem_pw("kakaoUser");
			String encodePassword = passwordEncoder.encode(dto.getMem_pw());
			dto.setMem_pw(encodePassword);
			
		}
		service.signupForm(dto);
		
		return "redirect:/member/login";
	}
	
	@RequestMapping(value="/loginForm") 
	@ResponseBody	// 로그인 요청 
	public String loginForm(String mem_id, String mem_pw) throws Exception{
		System.out.println(mem_id + " : " + mem_pw);
		MemberDTO dto = service.login(mem_id);
		if(dto != null && passwordEncoder.matches(mem_pw, dto.getMem_pw())) {
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
			System.out.println("넘어왔니?");
			if(dto.getMem_black().equals("Y")) {
				return "blackMem";
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/toLogin") // toLogin페이지 요청
	public String toLogin() {
		System.out.println("toLogin 페이지 요청");
		return "home";
	}
	
	
	@RequestMapping(value="/toKakao")
	public String home(String code) {
		System.out.println("code : " + code);
		return "home";
	}
	
	
	// 카카오 로그인
		@ResponseBody
		@RequestMapping(value = "/kakaoLogin")
		public String kakaoLogin(String mem_id) throws Exception{
			MemberDTO dto = service.kakaoLogin(mem_id);
			if(dto != null) {
				session.setAttribute("loginSession", dto);
				System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
				return "success";
			} else {
				return "fail";
			}
		}
		

		// 카카오 회원가입 페이지 이동
		//@ResponseBody
		@RequestMapping(value = "/kakaoSignUp")
		public String toKakaoSignUp(String mem_id, Model model) throws Exception{
			System.out.println(mem_id);
			System.out.println("도착");
			MemberDTO dto = service.login(mem_id);
			if(dto != null) {
				session.setAttribute("loginSession", dto);
				return "home";
			}else {
				model.addAttribute("mem_id", mem_id);
				return "member/kakaoSignUp";
			}
			
		}

		
		// 로그아웃
		@RequestMapping(value = "/logout")
		public String logout() {
			session.removeAttribute("loginSession");
			return "redirect:/member/login";
		}
		

		
		
}
