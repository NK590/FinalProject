package com.helper.planner;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<PlannerDTO> selectAll()throws Exception{ // 일정 출력
		
		return session.selectList("plannerMapper.selectAll");
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
	
}















