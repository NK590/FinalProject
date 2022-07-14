package com.helper.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {
	
	@Autowired
	private StudyService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/toRecord")
	public String toRecord(Model model) throws Exception {
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginSession");
		
//		List<String> time_subjectList = service.subjectList(memberDTO.getMem_seq()); // 과목 list
		List<String> time_subjectList = service.subjectList(1); // 오늘 과목 list
//		List<Integer> time_countList = service.timeList(memberDTO.getMem_seq()); // 과목별 시간 list
		List<Integer> time_countList = service.countList(1); // 오늘 과목별 시간 list
//		List<Integer> time_weekList = service.myWeekList(memberDTO.getMem_seq()); // 이번주 월-금 시간List
		List<Integer> time_weekList = service.myWeekList(1); // 이번주 월-금 시간List
//		List<Integer> time_LastWeekList = service.myLastWeekList(memberDTO.getMem_seq()); // 저번주 월-금 시간List
		List<Integer> time_LastWeekList = service.myLastWeekList(1); // 저번주 월-금 시간List
		int dayTotalTime = 0;
		int weekTotalTime = 0;
		for(int i : time_countList) {
			dayTotalTime += i;
		}
		for(int i : time_weekList) {
			weekTotalTime += i;
		}
		
		model.addAttribute("subjectList", time_subjectList);
		model.addAttribute("countList",time_countList);
		model.addAttribute("weekList", time_weekList);
		model.addAttribute("lastWeekList",time_LastWeekList);
		model.addAttribute("dayTotalTime", dayTotalTime);
		model.addAttribute("weekTotalTime", weekTotalTime);
		return "study/record";
	}
	
}
