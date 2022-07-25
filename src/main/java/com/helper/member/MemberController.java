package com.helper.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
			//id값 가져와서 뿌리기
			//session.setAttribute("mem_id", dto.getMem_id());
			String mem_id = dto.getMem_id();
			return mem_id;
			
		} else {
			
			return "no";
		}
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

	
	
	@RequestMapping(value = "/certificationEmail")
	@ResponseBody// 이메일 인증번호 발송
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
		System.out.println(dto.toString());
		String encodePassword = passwordEncoder.encode(dto.getMem_pw());
		dto.setMem_pw(encodePassword); 
		System.out.println("encodePassword : " + encodePassword);
		service.signupForm(dto);
		
		return "redirect:/member/login";
	}
	
	@RequestMapping(value="/loginForm") 
	@ResponseBody	// 로그인 요청 
	public String loginForm(String mem_id, String mem_pw) throws Exception{
		System.out.println(mem_id + " : " + mem_pw);
		//MemberDTO dto = null;
		MemberDTO dto = service.login(mem_id);
		System.out.println(dto);
		//boolean pwdMatch = passwordEncoder.matches(mem_pw, dto.getMem_pw());
		if(dto != null && passwordEncoder.matches(mem_pw, dto.getMem_pw())) {
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
			System.out.println("넘어왔니?");
			
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
	
	
//	@RequestMapping(value="/kakaoLogin")
//	public String home(Locale locale, Model model) {
//		return "home";
//	}
	
	// 카카오 로그인
		@ResponseBody
		@RequestMapping(value = "/kakaoLogin")
		public String kakaoLogin(String email) throws Exception{
			MemberDTO dto = service.kakaoLogin(email);
			if(dto != null) {
				session.setAttribute("loginSession", dto);
				System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
				return "success";
			} else {
				return "fail";
			}
			
		}

		// 카카오 회원가입 페이지 이동
		@RequestMapping(value = "/toKakaoSignUp")
		public String toKakaoSignUp(String email, Model model) {
			System.out.println("도착");
			model.addAttribute("email", email);
			return "/member/kakaoSignUp";
		}
		
		// 로그아웃
		@RequestMapping(value = "/logout")
		public String logout() {
			session.removeAttribute("loginSession");
			return "redirect: /";
		}
	
	
	
	// 카카오 로그인 토큰 받기
//		@RequestMapping(value="/kakaoLogin")
//		public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
//	        System.out.println("#########" + code);
//	        return "member/signup";
//	        String access_Token = service.getAccessToken(code);
//	        KakaoDTO userInfo = service.getUserInfo(access_Token);
//	        KakaoDTO number = service.kakaoNumber(userInfo); //
//	        session.invalidate();
//	        session.setAttribute("kakaoName", userInfo.getkakao_name());
//	        session.setAttribute("kakaoEmail", userInfo.getkakao_email());
//	        session.setAttribute("kakaoNumber", number.getkakao_seq());
//	        return "member/signup";
//	    }
	
		
	
	

}
