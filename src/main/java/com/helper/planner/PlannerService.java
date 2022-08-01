package com.helper.planner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helper.member.MemberDTO;

@Service
public class PlannerService {
	@Autowired
	private PlannerDAO dao;

	public int planInsert(Map<String,Object> jsonData,int mem_seq) throws Exception { // 일정 추가
		System.out.println("Service : "+jsonData);


		int plan_seq = dao.selectSeq();// plan_seq값 얻기
		// Object형으로 변환된 데이터를 String값으로 변환시켜준다
		String title = (String)jsonData.get("plan_title");
		String content = (String)jsonData.get("plan_content");
		String background = (String)jsonData.get("plan_background");
		String start = (String)jsonData.get("plan_start");
		String end = (String)jsonData.get("plan_end");
		/*Boolean allDay = (Boolean)jsonData.get("plan_allDay");
		System.out.println(allDay);
		if(allDay) {
			int plan_allDay = 0;
		}else if(!allDay) {
			int plan_allDay = 1;
		}*/
        PlannerDTO dto = new PlannerDTO(plan_seq,mem_seq,title,content,background,start,end);

		System.out.println("after : "+dto.toString());
		return dao.planInsert(dto);
	}
	public int delete(int plan_seq)throws Exception{ // 일정 삭제
	
			System.out.println(plan_seq);
			
			
		return dao.delete(plan_seq);
	}
	public int update(Map<String,Object>jsonData)throws Exception{ // 일정 수정
		if(jsonData.get("plan_seq")!="") {System.out.println(jsonData.get("plan_seq"));
		String plan_start = (String)jsonData.get("plan_start");
		String plan_end = (String)jsonData.get("plan_end");
		int plan_seq = Integer.parseInt((String)jsonData.get("plan_seq"));
		System.out.println("plan_seq :"+plan_seq);
		
		Map<String,Object> map = new HashMap<>();
		map.put("plan_start", plan_start);
		map.put("plan_end", plan_end);
		map.put("plan_seq", plan_seq);
		System.out.println("updateMap : "+map);		
		return dao.update(map);
	} else{	// 일정을 추가하고 바로 스케줄을 바로 변경할 때 (plan_seq값이 담겨있지 않을때 일정변경)
		
		return 0;
		}
	}

	public List<PlannerDTO> selectAll()throws Exception{ // 모든 일정 출력	
		
		return dao.selectAll();
	}
	public PlannerDTO selectPlan_seq(int plan_seq)throws Exception { // plan_seq로 정보값 얻기
		
		return dao.selectPlan_seq(plan_seq);
	}
	public int updateModal(PlannerDTO dto)throws Exception{ // 모달창에서 일정 수정하기
		System.out.println(dao.updateModal(dto));
		return dao.updateModal(dto);
	}
	
	
}


















