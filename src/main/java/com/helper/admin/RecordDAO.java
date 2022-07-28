package com.helper.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecordDAO {

	@Autowired
	private SqlSession session;

	// 메인페이지 top3
	public List<Map<String, Object>> selectTopMem() throws Exception {
		List<Map<String, Object>> list = session.selectList("adminMapper.selectTopMem");
		for (Map<String, Object> l : list) {
			int time_count = Integer.parseInt(String.valueOf(l.get("time_count"))); // 초값 받아옴
			int hour = time_count/(60*60);
			int min = time_count/60-(hour*60);
			int sec = time_count%60;
			String hourZero = "";
			if(hour < 10) {
				hourZero = "0";
			}
			String minZero = "";
			if(min < 10) {
				minZero = "0";
			}
			String secZero = "";
			if(sec < 10) {
				secZero = "0";
			}
			l.put("time_count", hourZero+hour+":"+minZero+min+":"+secZero+sec);
		}
		return list;
	}
	
	public List<Map<String, Object>> selectTopGroup() throws Exception {
		List<Map<String, Object>> list = session.selectList("adminMapper.selectTopGroup");
		for (Map<String, Object> l : list) {
			int time_count = Integer.parseInt(String.valueOf(l.get("group_count"))); // 초값 받아옴
			int hour = time_count/(60*60);
			int min = time_count/60-(hour*60);
			int sec = time_count%60;
			String hourZero = "";
			if(hour < 10) {
				hourZero = "0";
			}
			String minZero = "";
			if(min < 10) {
				minZero = "0";
			}
			String secZero = "";
			if(sec < 10) {
				secZero = "0";
			}
			l.put("group_count", hourZero+hour+":"+minZero+min+":"+secZero+sec);
		}
		return list;
	}

}
