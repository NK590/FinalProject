package com.helper.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Service
public class StudyService {
	@Autowired
	private TimeDAO timedao;
	@Autowired
	private SubjectDAO subjectdao;
	@Autowired
	private StudyDAO dao;
	
	public void insertAll(List<TimeDTO> list)throws Exception{
		timedao.insertAll(list);
	}
	public int selectrecord()throws Exception{
		return timedao.selectrecord();
	}
	public int selectsubject(String time_subject)throws Exception{
		return timedao.selectsubject(time_subject);
	}
	public void insertOne(TimeDTO dto)throws Exception{
		timedao.insertOne(dto);
	}
	public void updatetime(TimeDTO dto)throws Exception{
		timedao.updatetime(dto);
	}
	public void deletesubject()throws Exception{
		subjectdao.deletesubject();
	}
	public void insertsubject(List<SubjectDTO> list)throws Exception{
		subjectdao.insertsubject(list);
	}
	public List<SubjectDTO> selectall()throws Exception{
		return subjectdao.selectall();
	}
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
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
}
