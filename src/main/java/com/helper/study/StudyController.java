package com.helper.study;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.member.MemberDTO;
import com.helper.utils.Crawl;
import com.helper.week.WeekDTO;
import com.helper.week.WeekService;

@RequestMapping("/study")
@Controller
public class StudyController {
	@Autowired
	private Crawl crawlUtils;
	@Autowired
	private HttpSession session;
	@Autowired
	private StudyService service;
	@Autowired
	private WeekService weekservice;

	// 크롤링 검색
	@ResponseBody
	@RequestMapping(value = "/dicSearch", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> dicSearch(String queryInput, String languageInput, Model model) throws Exception {
		System.out.println("검색한 단어 : " + queryInput);
		List<String> list = crawlUtils.getCrawlResult(queryInput, languageInput);
		return list;
	}

	@RequestMapping(value = "/toStudy")
	public String toStudy(Model model)throws Exception{
		MemberDTO memdto = (MemberDTO)session.getAttribute("loginSession");
		if(memdto == null) {
			model.addAttribute("record",0);
			return "study/study";
		}
		System.out.println("공부하기 페이지 요청");
		int mem_seq = memdto.getMem_seq();
		List<SubjectDTO> subjectlist = service.selectall(mem_seq);
		if(weekservice.selectIsRecord(mem_seq)!=0) {			
			int record = weekservice.selectSumToday(mem_seq);
			model.addAttribute("record",record);
		}else {
			model.addAttribute("record",0);
		}
		model.addAttribute("subjectlist",subjectlist);		
		return "study/study";
	}

	@ResponseBody
	@RequestMapping(value = "/record")
	public String record(@RequestBody List<TimeDTO> list)throws Exception{
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		List<Integer> arr = new ArrayList<>();
		for(TimeDTO dto : list) {
			arr.add(dto.getTime_count());
		}
		int record_time = arr.stream().mapToInt(Integer::intValue).sum();//weekrecord로 보내기 위해 합쳐줌
		SimpleDateFormat now = new SimpleDateFormat ("MM/dd");//weekrecord를 위해 현재날짜를 string 형식으로 바꿔줌
		String record_week = now.format (System.currentTimeMillis());
		WeekDTO weekdto = new WeekDTO();
		weekdto.setMem_seq(mem_seq);
		weekdto.setRecord_time(record_time);
		weekdto.setRecord_week(record_week);
		service.insertWeek(weekdto);
		if(service.selectrecord(mem_seq)==0) {
			service.insertAll(list);
			
		}else {
			for(TimeDTO dto : list) {
				if(service.selectsubject(dto)==0) {//겹치는 과목명이 없다
					service.insertOne(dto);
				}else {//겹치는 과목명이 있다.
					service.updatetime(dto);
				}
			} 
		}	
		return "success";
	}

	@RequestMapping(value = "/recordSubject")
	public String recordSubjcet(@RequestBody List<SubjectDTO> list)throws Exception{
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		
			if(service.selectSubjectAll(mem_seq)==0) {//미리저장된 과목 기록이 없다
				service.insertsubject(list);	
			}else {//미리저장된 과목 기록이 있다
				for(SubjectDTO dto : list) {
				service.deletesubject(dto.getMem_seq());//저장된거 지우고
				}
				service.insertsubject(list);//list에 넣자
			}			
		return "success";
	}

	@RequestMapping(value = "/toRecord")
	public String toRecord(Model model) throws Exception {
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginSession");
	    List<String> time_subjectList = new ArrayList<String>();
	    List<Integer> time_countList = new ArrayList<Integer>();
	    List<Map<String, Object>> time_list =service.countList(memberDTO.getMem_seq());
	    List<Integer> time_weekList = service.myWeekList(memberDTO.getMem_seq()); // 이번주 월-금 시간List
	    List<Integer> time_LastWeekList = service.myLastWeekList(memberDTO.getMem_seq()); // 저번주 월-금 시간List
	    List<Integer> time_countListSec = service.countListSec(memberDTO.getMem_seq());
	    List<Integer> time_weekListSec = service.myWeekListSec(memberDTO.getMem_seq());
	    int dayTotalTime = 0;
		int weekTotalTime = 0;
		for(Map<String, Object> sub : time_list) {
			time_subjectList.add((String)sub.get("time_subject"));
			time_countList.add(Integer.parseInt(String.valueOf(sub.get("time_count"))));
		}
		for (int i : time_countListSec) {
			dayTotalTime += i;
		}
		for (int i : time_weekListSec) {
			weekTotalTime += i;
		}
		model.addAttribute("subjectList", time_subjectList);
		model.addAttribute("countList", time_countList);
		model.addAttribute("weekList", time_weekList);
		model.addAttribute("lastWeekList", time_LastWeekList);
		model.addAttribute("dayTotalTime", dayTotalTime);
		model.addAttribute("weekTotalTime", weekTotalTime);
		return "study/record";
	}

	@RequestMapping(value = "/toError") // 에러페이지로 이동
	public String toError() {
		return "error";
	}

	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외발생");
		e.printStackTrace();
		return "redirect:/toError";
	}

}
