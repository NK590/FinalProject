package com.helper.week;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeekService {

	@Autowired
	private WeekDAO dao;
	
	//오늘 공부시간 합계
		public int selectSumToday(int mem_seq)throws Exception{
			return dao.selectSumToday(mem_seq);
		}
	//오늘 공부시간이 있는지
		public int selectIsRecord(int mem_seq)throws Exception{
			return dao.selectIsRecord(mem_seq);
		}
}
