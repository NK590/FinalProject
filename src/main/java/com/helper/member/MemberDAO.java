package com.helper.member;

import java.util.ArrayList;
import java.util.List;

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
	public int dropoutInfo(int mem_seq) throws Exception {
		return session.delete("memberMapper.dropoutInfo", mem_seq);
	}
	
	// 마이페이지 나의 커뮤니티
	public List<BoardDTO> myBoard(int mem_seq)throws Exception{
		return session.selectList("memberMapper.myBoard", mem_seq); 
	}
	
	// 마이페이지 나의 그룹
	public ArrayList<GroupDTO> myGroup(int group_seq)throws Exception{
		return (ArrayList)session.selectList("memberMapper.myGroup", group_seq); 
	}
	
	// 그룹 가입 여부 체크
	public int checkJoinStatus(int mem_seq) throws Exception {
		return session.selectOne("memberMapper.checkJoinStatus" ,mem_seq);
	}
	
	// 그룹 가입, 탈퇴 시 가입 그룹 번호 업데이트
	public void updateGroupSeq(MemberDTO dto) throws Exception {
		session.update("memberMapper.updateGroupSeq", dto);
	}
	
	// 특정 그룹 번호에 가입된 회원 조회
	public List<MemberDTO> selectByGroupSeq(int group_seq) throws Exception {
		return session.selectList("memberMapper.selectByGroupSeq", group_seq);
	}
}
