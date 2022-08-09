package com.helper.home;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.helper.admin.AdminService;

@Controller
public class HomeController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/")
	public String home(Model model) throws Exception {
		adminService.visitCount();
		List<Map<String, Object>> todayList = adminService.selectTopMem();
		System.out.println(todayList + "투");
		List<Map<String, Object>> groupList = adminService.selectTopGroup();
		System.out.println(groupList + "그룹");
		model.addAttribute("todayList", todayList);
		model.addAttribute("groupList",groupList);
		return "home";
	}
	
	@RequestMapping(value = "/notLogin")
	public String notLogin() throws Exception {
		System.out.println("로그인 풀림");
		return "notLogin";
	}
	   @ExceptionHandler
	   public String errorerror(Exception e) {
	      System.out.println("예외 발생");
	      e.printStackTrace();
	      return "redirect:/error";
	   }
}
