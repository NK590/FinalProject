package com.helper.planner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping(value="planner")
@Controller
public class PlannerController {
	@Autowired
	private PlannerService service;
	@Autowired
	private HttpSession session;
}
