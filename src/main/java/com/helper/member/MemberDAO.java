package com.helper.member;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helper.board.BoardDTO;
import com.helper.group.GroupDTO;

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
	public MemberDTO login(String mem_id) throws Exception {
		return session.selectOne("memberMapper.login", mem_id);
	}
	
	// 이메일 찾기
	public MemberDTO findNickname(String mem_nick) throws Exception{
		return session.selectOne("memberMapper.findNickname", mem_nick);
	}
	
	// 비밀번호 찾기
	public int update(MemberDTO dto) throws Exception{
		return session.update("memberMapper.update", dto);
	}
	
	// 카카오 로그인
	public MemberDTO kakaoLogin(String mem_id) throws Exception {
		return session.selectOne("memberMapper.kakaoLogin", mem_id);
	}
	
	// 카카오 회원가입
	public int insertKakao(MemberDTO dto) throws Exception {
		return session.insert("memberMapper.insertKakao", dto);
	}
	
	// 마이페이지 회원정보 수정
	public int updateInfo(MemberDTO dto) throws Exception {
		return session.update("memberMapper.updateInfo", dto);
	}
	
	// 마이페이지 회원탈퇴
	public void dropoutInfo(MemberDTO dto) throws Exception {
		session.delete("memberMapper.dropoutInfo", dto);
	}
	
	// 마이페이지 내가 쓴 게시글
	public ArrayList<BoardDTO> myBoard(int mem_seq) {
		return (ArrayList)session.selectList("memberMapper.myBoard", mem_seq); 
	}
	
	// 마이페이지 내가 쓴 게시글
	public ArrayList<GroupDTO> myGroup(int group_seq) {
		return (ArrayList)session.selectList("memberMapper.myGroup", group_seq); 
	}
	
	


}
