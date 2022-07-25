package com.helper.group;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/group")
public class GroupController {
	@Autowired
	private GroupService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/")
	public String home(Model model) throws Exception {
		
		return "group/home";
	}
	
	@RequestMapping(value="/room")
	public String room(int group_seq, Model model) throws Exception {
		
	}
}
