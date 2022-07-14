package com.helper.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public void insert(MemberDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	// 아이디 중복확인
	public MemberDTO checkEmail(String mem_id) throws Exception{
		return dao.checkEmail(mem_id);
	}
	
	public List<MemberDTO> loginOk(String mem_id, String mem_pw) throws Exception{
		return dao.loginOk(mem_id, mem_pw);
	}
	
	
	
}
