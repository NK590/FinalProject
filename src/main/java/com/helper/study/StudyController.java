package com.helper.study;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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


@RequestMapping("/study")
@Controller
public class StudyController {
	@Autowired
	private Crawl crawlUtils;
	@Autowired
	private HttpSession session;
	@Autowired
	private StudyService service;
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
		int mem_seq = memdto.getMem_seq();
		System.out.println("공부하기 페이지 요청");
		List<SubjectDTO> subjectlist = service.selectall(mem_seq);
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
				if(service.selectsubject(dto)==0) {//오늘 시간 기록을 한적 없다.
					service.insertOne(dto);
				}else {//오늘 시간기록을 한적 있다.
					service.updatetime(dto);
				}
			} 
		}	
		return "success";
	}
	@RequestMapping(value = "/recordSubject")
	public String recordSubjcet(@RequestBody List<SubjectDTO> list)throws Exception{
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		
			if(service.selectrecord(mem_seq)==0) {
				service.insertsubject(list);	
			}else {
				for(SubjectDTO dto : list) {
				service.deletesubject(dto.getMem_seq());
				}
				service.insertsubject(list);
			}
			
		return "success";
	}
	
	@RequestMapping(value = "/toRecord")
	   public String toRecord(Model model) throws Exception {
//	      MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginSession");
	      
//	      List<String> time_subjectList = service.subjectList(memberDTO.getMem_seq()); // 과목 list
	      List<String> time_subjectList = service.subjectList(1); // 오늘 과목 list
//	      List<Integer> time_countList = service.timeList(memberDTO.getMem_seq()); // 과목별 시간 list
	      List<Integer> time_countList = service.countList(1); // 오늘 과목별 시간 list
//	      List<Integer> time_weekList = service.myWeekList(memberDTO.getMem_seq()); // 이번주 월-금 시간List
	      List<Integer> time_weekList = service.myWeekList(1); // 이번주 월-금 시간List
//	      List<Integer> time_LastWeekList = service.myLastWeekList(memberDTO.getMem_seq()); // 저번주 월-금 시간List
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
	@RequestMapping(value= "/toError") // 에러페이지로 이동
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
