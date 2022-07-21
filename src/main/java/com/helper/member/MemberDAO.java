package com.helper.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	// 회원가입
	public int insert(MemberDTO dto) throws Exception {
		return session.insert("memberMapper.insert", dto);
	}

	// 아이디 중복확인
	public MemberDTO checkEmail(String mem_id) throws Exception {
		return session.selectOne("memberMapper.checkEmail", mem_id);
	}
	
	// 로그인
	public MemberDTO login(String mem_id, String mem_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pw", mem_pw);
		
		return session.selectOne("memberMapper.login", map);
	}
	
	// 카카오 로그인
		public MemberDTO kakaoLogin(String email) throws Exception {
			return session.selectOne("memberMapper.checkEmail", email);
		}
	
	
	
	
	
	
	
	
	
		// 카카오 로그인
//		public void kakaoinsert(HashMap<String, Object> userInfo) {
//			session.insert("Member.kakaoInsert",userInfo);
//		}

		// 카카오 확인
//		public KakaoDTO findkakao(HashMap<String, Object> userInfo) {
//			System.out.println("RN:"+userInfo.get("nickname"));
//			System.out.println("RE:"+userInfo.get("email"));
//			return session.selectOne("Member.findKakao", userInfo);
//		}
//		
//		public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
//			return session.selectOne("Member.kakaoNumber",userInfo);
//		}

}
