package com.helper.planner;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.member.MemberDTO;
import com.helper.study.TimeDTO;


@RequestMapping(value="/planner")
@Controller
public class PlannerController {
	@Autowired
	private PlannerService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/toPlanner")
	public String toPlanner(Model model,int mem_seq)throws Exception{	// 플래너 페이지 요청  // mem_seq 값 넘겨주기
			// 공부기록
			List<TimeDTO> timeList = service.recordForPlanner(mem_seq);
				model.addAttribute("timeList",timeList);		
			// 플래너 
			List<PlannerDTO> list = service.selectAll(mem_seq);
			model.addAttribute("list", list);
		return "/planner/planner";
	}
	@RequestMapping(value="/planInsert")
	@ResponseBody
	public String planInsert(@RequestBody Map<String, Object> jsonData)throws Exception{	// 일정 추가  + dto에 멤버mem_seq 넣어주기 
																							// json형식으로 넘겨받은 데이터는 Map형식으로 값을 받아와야한다
		System.out.println("jsondata : " +jsonData);										
		int mem_seq = ((MemberDTO)session.getAttribute("loginSession")).getMem_seq();
		System.out.println(mem_seq);
        int rs = service.planInsert(jsonData,mem_seq);
		
        if(rs>0) { // 일정 등록 성공
        	return "success";
        }
		return"fail";
	}
	@RequestMapping(value="/planDelete")
	@ResponseBody
	public String planDelete(int plan_seq)throws Exception{	 // 일정 삭제  + 멤버mem_seq 같이 넘겨주기
		int rs = service.delete(plan_seq);
		
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/planUpdate")
	@ResponseBody
	public String planUpdate(@RequestBody Map<String,Object>jsonData)throws Exception{ // 드래그로 일정 수정 + 멤버mem_seq 같이 넘겨주기
			System.out.println(jsonData);
			int rs = service.update(jsonData);
			if(rs>0) {
				return "success";
			}else {
				return "fail";
			}
	}
	@RequestMapping(value="/selectPublicId")	// plan_seq 로 DTO 뽑아내기
	@ResponseBody
	public PlannerDTO selectPublicId (int plan_seq)throws Exception{
		System.out.println(plan_seq);
		PlannerDTO dto= service.selectPlan_seq(plan_seq);
		
		return dto;
	}
	@RequestMapping(value="/planUpdateModal")	// 모달창으로 정보를 수정했을때
	@ResponseBody
	public String updateModal(PlannerDTO dto)throws Exception {

		System.out.println(dto.toString());
		int rs = service.updateModal(dto);
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}








