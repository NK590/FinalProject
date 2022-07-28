package com.helper.planner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlannerService {
	@Autowired
	private PlannerDAO dao;

	public int planInsert(PlannerDTO dto) throws Exception { // 일정 추가
		int plan_seq = dao.selectSeq();// 플래너의 시퀀스
		dto.setPlan_seq(plan_seq);
		System.out.println("after : "+dto.toString());
		return dao.planInsert(dto);
	}
	public int delete(Map<String,Object> jsonData)throws Exception{ // 일정 삭제
//			System.out.println(jsonData);			
//			String plan_title = (String)jsonData.get("plan_title"); 
//			String plan_start = (String)jsonData.get("plan_start");
//			String plan_end = (String)jsonData.get("plan_end");
			int plan_seq = Integer.parseInt((String)jsonData.get("plan_seq"));
//			Map<String,Object> map = new HashMap<>();
//			map.put("plan_title", plan_title);
//			map.put("plan_start", plan_start);
//			map.put("plan_end", plan_end);
//			map.put("plan_seq", plan_seq);			
			System.out.println(plan_seq);
			
			
		return dao.delete(plan_seq);
	}
	public int update(Map<String,Object>jsonData)throws Exception{ // 일정 수정
		String plan_start = (String)jsonData.get("plan_start");
		String plan_end = (String)jsonData.get("plan_end");
		int plan_seq = Integer.parseInt((String)jsonData.get("plan_seq"));
		Map<String,Object> map = new HashMap<>();
		map.put("plan_start", plan_start);
		map.put("plan_end", plan_end);
		map.put("plan_seq", plan_seq);
		System.out.println("updateMap : "+map);		
		return dao.update(map);
	}
	
	
	public List<PlannerDTO> selectAll()throws Exception{ // 모든 일정 출력	
		
		return dao.selectAll();
	}
	
}






