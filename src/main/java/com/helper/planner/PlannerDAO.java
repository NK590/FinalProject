package com.helper.planner;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helper.study.TimeDTO;

@Repository
public class PlannerDAO {
	@Autowired
	private SqlSession session;
	
	public int selectSeq()throws Exception{ // plan_seq 번호 
		return session.selectOne("plannerMapper.selectSeq");
	}
	public int planInsert(PlannerDTO dto)throws Exception{ // 일정 추가
		return session.insert("plannerMapper.insert",dto);
	}
	public List<PlannerDTO> selectAll(int mem_seq)throws Exception{ // 일정 출력
		
		return session.selectList("plannerMapper.selectAll",mem_seq);
	}
//	public Date getToDate (String date)throws Exception{ // String을 Date형으로 변
//		
//		return session.selectOne("plannerMapper.getToDate",date);
//	}
	public int delete (int plan_seq)throws Exception {	// 일정 삭제
		System.out.println(plan_seq);
		return session.delete("plannerMapper.delete",plan_seq);
	}
	public int update(Map map)throws Exception{ // 일정 수정
	
		return session.update("plannerMapper.update",map);
	}
	public int updateNoSeq(Map map)throws Exception{
		return session.update("plannerMapper.udpateNoSeq",map);
	}
	public PlannerDTO selectPlan_seq(int plan_seq)throws Exception{ // plan_seq로 DTO뽑아내기
		
		return session.selectOne("plannerMapper.selectPlan_seq",plan_seq);
	}
	public int updateModal(PlannerDTO dto)throws Exception{ // modal로 일정수정하기
		System.out.println("dto : "+dto);
		return session.update("plannerMapper.updateModal",dto);
	}
	public List<Map<String,String>> recordForPlanner(int mem_seq)throws Exception{ // TimeDTO list 출력
		
		System.out.println("list : "+session.selectList("plannerMapper.recordForPlanner", mem_seq));
		return session.selectList("plannerMapper.recordForPlanner", mem_seq);
	}
	
}















