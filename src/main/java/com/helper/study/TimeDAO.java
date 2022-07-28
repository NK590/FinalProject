package com.helper.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimeDAO {
	@Autowired
	private SqlSession session;
	public void insertAll (List<TimeDTO> list)throws Exception{
		session.update("studyMapper.insertAll",list);
	}
	public int selectrecord (int mem_seq)throws Exception{
		return session.selectOne("studyMapper.selectrecord",mem_seq);
	}
	public int selectsubject(TimeDTO dto)throws Exception{
		return session.selectOne("studyMapper.selectsubject",dto);
	}
	public void insertOne(TimeDTO dto)throws Exception{
		session.insert("studyMapper.insertOne",dto);
	}
	public void updatetime(TimeDTO dto)throws Exception{
		session.update("studyMapper.updatetime",dto);
	}
}
