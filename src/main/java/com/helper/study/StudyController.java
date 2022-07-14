package com.helper.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.utils.Crawl;

@RequestMapping(value = "/study")
@Controller
public class StudyController {
	@Autowired
	private Crawl crawlUtils;
	
	// crawlSample.jsp 매핑
	@RequestMapping(value = "/crawl")
	public String crawl() throws Exception {
		return "study/crawlSample";
	}
	
	// 크롤링 검색
	@ResponseBody
	@RequestMapping(value = "/dicSearch", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> dicSearch(String queryInput, String languageInput, Model model) throws Exception {
		System.out.println("검색한 단어 : " + queryInput);
		
		List<String> list = crawlUtils.getCrawlResult(queryInput, languageInput);
		
		return list;
	}
}
