package com.helper.home;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helper.admin.AdminService;

@Controller
public class HomeController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/")
	public String home(Model model) throws Exception {
		List<Map<String, Object>> todayList = adminService.selectTopMem();
		List<Map<String, Object>> groupList = adminService.selectTopGroup();
		model.addAttribute("todayList", todayList);
		model.addAttribute("groupList",groupList);
		return "home";
	}
	
}
