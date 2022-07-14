package com.helper.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession session;
	
	
	// 게시글 전체 조회
	public List<BoardDTO> selectAll()throws Exception{
		return session.selectList("boardMapper.selectAll");
	}
	// 게시글 등록
	public int insert(BoardDTO dto)throws Exception{
		return session.insert("boardMapper.insert",dto);
	}
	// 새로운 게시글 시퀀스 번호 생성
	public int selectSeq()throws Exception{
		return session.selectOne("boardMapper.selectSeq");
	}
	// 게시글 시퀀스번호로 상세페이지 호출
	public BoardDTO selectOne(int bo_seq)throws Exception{
		return session.selectOne("boardMapper.selectOne",bo_seq);
	}
}















