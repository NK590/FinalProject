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


@RequestMapping(value="/planner")
@Controller
public class PlannerController {
	@Autowired
	private PlannerService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/toPlanner")
	public String toPlanner(Model model)throws Exception{	// 플래너 페이지 요청  // mem_seq 값 넘겨주기
			List<PlannerDTO> list = service.selectAll();
			model.addAttribute("list", list);
		return "/planner/planner";
	}
	@RequestMapping(value="/planInsert")
	@ResponseBody
	public String planInsert(@RequestBody Map<String, Object> jsonData)throws Exception{	// 일정 추가  + dto에 멤버mem_seq 넣어주기 
																							// json형식으로 넘겨받은 데이터는 Map형식으로 값을 받아와야한다
		System.out.println("jsondata : " +jsonData);										

        int rs = service.planInsert(jsonData);
		
        if(rs>0) { // 일정 등록 성공
        	return "success";
        }
		return"fail";
	}
	@RequestMapping(value="/planDelete")
	@ResponseBody
	public String planDelete(@RequestBody Map<String,Object> jsonData)throws Exception{	 // 일정 삭제  + 멤버mem_seq 같이 넘겨주기
		int rs = service.delete(jsonData);
		
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/planUpdate")
	@ResponseBody
	public String planUpdate(@RequestBody Map<String,Object>jsonData)throws Exception{ // 일정 수정 + 멤버mem_seq 같이 넘겨주기
			System.out.println(jsonData);
			int rs = service.update(jsonData);
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








