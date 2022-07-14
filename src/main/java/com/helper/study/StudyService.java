package com.helper.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudyService {

	@Autowired
	private StudyDAO dao;

	// 오늘 공부한 과목들
	public List<String> subjectList(int mem_seq) throws Exception {
		return dao.subjectList(mem_seq);
	}
	
	// 오늘 공부한 시간들
	public List<Integer> countList(int mem_seq) throws Exception {
		return dao.countList(mem_seq);
	}
	
	// 이번주 공부 시간값
	public List<Integer> myWeekList(int mem_seq) throws Exception {
		return dao.myWeekList(mem_seq);
	}
	
	// 저번주 공부 시간값
	public List<Integer> myLastWeekList(int mem_seq) throws Exception {
		return dao.myLastWeekList(mem_seq);
	}
	
	

}
