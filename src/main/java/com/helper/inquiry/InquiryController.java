package com.helper.inquiry;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

	
	@RequestMapping("/inquiry")
	@Controller
	public class InquiryController {
		@RequestMapping(value = "/inquiry")
		public String inquiry()throws Exception{	
			return "inquiry/inquiry";
		}
	}

