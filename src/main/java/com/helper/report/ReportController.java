package com.helper.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.admin.ReportDTO;

@RequestMapping(value="/report")
@Controller
public class ReportController {
	@Autowired
	private ReportService service;
	@RequestMapping(value="/reportInsert")
	@ResponseBody
	public String insert(ReportDTO dto)throws Exception{
		
		service.insert(dto);
		
		return "success";
	}
	
	
}
