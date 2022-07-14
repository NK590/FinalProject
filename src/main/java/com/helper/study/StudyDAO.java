package com.helper.study;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {

	@Autowired
	private SqlSession session;

	public List<String> subjectList(int mem_seq) throws Exception {

		return session.selectList("recordMapper.subjectList", mem_seq);
	}

	public List<Integer> countList(int mem_seq) throws Exception {
		List<Integer> countList = session.selectList("recordMapper.countList", mem_seq);
		// 초 > 분 으로 변경
		for (int i = 0; i < countList.size(); i++) {
			countList.set(i, countList.get(i) / 60);
		}
		return countList;
	}

	// 주간 데이터
	// 이번주 일별 공부시간 (분)
	public List<Integer> myWeekList(int mem_seq) throws Exception {
		List<Integer> time_weekList = new ArrayList<Integer>();
		time_weekList.add(session.selectOne("recordMapper.monRecord", mem_seq));
		time_weekList.add(session.selectOne("recordMapper.tueRecord", mem_seq));
		time_weekList.add(session.selectOne("recordMapper.wedRecord", mem_seq));
		time_weekList.add(session.selectOne("recordMapper.thuRecord", mem_seq));
		time_weekList.add(session.selectOne("recordMapper.friRecord", mem_seq));
		time_weekList.add(session.selectOne("recordMapper.satRecord", mem_seq));
		time_weekList.add(session.selectOne("recordMapper.sunRecord", mem_seq));
		for (int i = 0; i < time_weekList.size(); i++) {
			if (time_weekList.get(i) != null) {
				time_weekList.set(i, time_weekList.get(i) / 60);
			} else {
				time_weekList.set(i, 0);
			}
		}
		return time_weekList;
	}

	// 저번주 일별 공부시간 (분)
	public List<Integer> myLastWeekList(int mem_seq) throws Exception {
		List<Integer> time_LastWeekList = new ArrayList<Integer>();
		time_LastWeekList.add(session.selectOne("recordMapper.lastMonRecord", mem_seq));
		time_LastWeekList.add(session.selectOne("recordMapper.lastTueRecord", mem_seq));
		time_LastWeekList.add(session.selectOne("recordMapper.lastWedRecord", mem_seq));
		time_LastWeekList.add(session.selectOne("recordMapper.lastThuRecord", mem_seq));
		time_LastWeekList.add(session.selectOne("recordMapper.lastFriRecord", mem_seq));
		time_LastWeekList.add(session.selectOne("recordMapper.lastSatRecord", mem_seq));
		time_LastWeekList.add(session.selectOne("recordMapper.lastSunRecord", mem_seq));
		for (int i = 0; i < time_LastWeekList.size(); i++) {
			if (time_LastWeekList.get(i) != null) {
				time_LastWeekList.set(i, time_LastWeekList.get(i) / 60);
			} else {
				time_LastWeekList.set(i, 0);
			}
		}
		return time_LastWeekList;
	}

}
