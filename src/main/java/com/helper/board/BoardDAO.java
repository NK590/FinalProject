package com.helper.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession session;
	
	
	// 게시글 전체 조회
	public List<BoardDTO> selectAll(int start, int end)throws Exception{
		Map<String,Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("boardMapper.selectAll",map);
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
	// 게시글 삭제
	public int delete(int bo_seq)throws Exception{
		return session.delete("boardMapper.delete",bo_seq);
	}
	// 조회수
	public int updateCount(int bo_seq)throws Exception{
		return session.update("boardMapper.updateCount",bo_seq);
	}
	// 게시글 수정
	public int update(BoardDTO dto)throws Exception{
		
		return session.update("boardMapper.update",dto);
	}
	// 게시글 검색
	public List<BoardDTO> search(String category, String keyword,int start, int end)throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		return session.selectList("boardMapper.search",map);
	}
	// 게시글 총 개수
	public int getListCnt() throws Exception{
		return session.selectOne("boardMapper.getListCnt");
	}
	// 검색한 게시글의 총 개수
	public int searchPaging(String category, String keyword) throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		int rs = session.selectOne("boardMapper.searchPaging", map);
		return rs; 
	}
}















