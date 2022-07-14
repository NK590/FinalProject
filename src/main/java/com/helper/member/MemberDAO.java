package com.helper.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;

	public void insert(MemberDTO dto) throws Exception {
		session.insert("memberMapper.insert", dto);
	}

	// 아이디 중복확인
	public MemberDTO checkEmail(String mem_id) throws Exception {
		return session.selectOne("memberMapper.checkEmail", mem_id);
	}

	public List<MemberDTO> loginOk(String mem_id, String mem_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pw", mem_pw);
		
		return session.selectList("memberMapper.loginOk", map);
	}

}
