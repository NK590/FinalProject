package com.helper.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.helper.week.WeekDAO;
import com.helper.week.WeekDTO;

@Service
public class StudyService {
	@Autowired
	private TimeDAO timedao;
	@Autowired
	private SubjectDAO subjectdao;
	@Autowired
	private StudyDAO dao;
	@Autowired
	private WeekDAO weekdao;

	public void insertAll(List<TimeDTO> list) throws Exception {
		timedao.insertAll(list);
	}

	public int selectrecord(int mem_seq) throws Exception {
		return timedao.selectrecord(mem_seq);
	}

	public int selectsubject(TimeDTO dto) throws Exception {
		return timedao.selectsubject(dto);
	}

	public void insertOne(TimeDTO dto) throws Exception {
		timedao.insertOne(dto);
	}

	public void updatetime(TimeDTO dto) throws Exception {
		timedao.updatetime(dto);
	}

	public void deletesubject(int mem_seq) throws Exception {
		subjectdao.deletesubject(mem_seq);
	}

	public void insertsubject(List<SubjectDTO> list) throws Exception {
		subjectdao.insertsubject(list);
	}

	public List<SubjectDTO> selectall(int mem_seq) throws Exception {
		return subjectdao.selectall(mem_seq);
	}
	public int selectSubjectAll(int mem_seq)throws Exception{
		return subjectdao.selectSubjectAll(mem_seq);
	}

	// 오늘 공부한 과목들
	public List<String> subjectList(int mem_seq) throws Exception {
		return dao.subjectList(mem_seq);
	}

	// 오늘 공부한 시간들
	public List<Map<String, Object>> countList(int mem_seq) throws Exception {
		return dao.countList(mem_seq);
	}

	// 오늘 공부한 초값
	public List<Integer> countListSec(int mem_seq) throws Exception {
		return dao.countListSec(mem_seq);
	}

	// 이번주 공부 시간값
	public List<Integer> myWeekList(int mem_seq) throws Exception {
		return dao.myWeekList(mem_seq);
	}

	// 이번주 공부 초 값
	public List<Integer> myWeekListSec(int mem_seq) throws Exception {
		return dao.myWeekListSec(mem_seq);
	}

	// 저번주 공부 시간값
	public List<Integer> myLastWeekList(int mem_seq) throws Exception {
		return dao.myLastWeekList(mem_seq);
	}

	public int insertWeek(WeekDTO weekdto) throws Exception {
		return weekdao.insertWeek(weekdto);
	}

}
