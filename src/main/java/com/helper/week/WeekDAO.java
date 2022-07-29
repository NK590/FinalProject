package com.helper.week;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WeekDAO {
	
	@Autowired
	private SqlSession session;
	
	public int insertWeek(WeekDTO dto) {
		return session.insert("studyMapper.insertWeek",dto);
	}
	
	//오늘 공부시간 합 
	public int selectSumToday (int mem_seq)throws Exception{
		return session.selectOne("studyMapper.selectSumToday",mem_seq);
	} 
}
