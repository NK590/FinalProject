package com.helper.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/librarymap")
@Controller
public class MapController {
	@RequestMapping(value = "/librarymap")
	public String librarymap()throws Exception{	
		return "librarymap/librarymap";
	}
}
