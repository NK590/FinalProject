package com.helper.member;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helper.board.BoardDTO;
import com.helper.group.GroupDTO;

@Service
public class MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	// 회원가입
	public int signupForm(MemberDTO dto) throws Exception{
		return dao.insert(dto);
	}
	
	// 이메일 중복확인
	public MemberDTO checkEmail(String mem_id) throws Exception{
		return dao.checkEmail(mem_id);
	}
	
	// 로그인
	public MemberDTO login(String mem_id) throws Exception{
		return dao.login(mem_id);
	}
	
	// 이메일 찾기
	public MemberDTO findNickname(String mem_nick) throws Exception{
		return dao.findNickname(mem_nick);
	}
	
	// 비밀번호 찾기
	public int findPasswordForm(MemberDTO dto) throws Exception{
		return dao.update(dto);
	}
	
	// 카카오 로그인
	public MemberDTO kakaoLogin(String mem_id) throws Exception{
		return dao.kakaoLogin(mem_id);
	}
		
	// 카카오 회원가입
	public int kakaoSignUp(MemberDTO dto) throws Exception{
		return dao.insert(dto);
	}
	
	// 마이페이지 회원정보 수정
	public int updateForm(MemberDTO dto) throws Exception{
		return dao.updateInfo(dto);
	}
	
	//마이페이지 회원탈퇴
	public void dropoutForm(MemberDTO dto) throws Exception{
		dao.dropoutInfo(dto);
	}
	
	//마이페이지 내가쓴 게시글
	public ArrayList<BoardDTO> myBoard(int mem_seq) {
		return dao.myBoard(mem_seq);
	}
	
	//마이페이지 나의 그룹
	public ArrayList<GroupDTO> myGroup(int group_seq) {
		return dao.myGroup(group_seq);
	}

	
}
