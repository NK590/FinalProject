package com.helper.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession session;
	
	//공지사항삽입
	public int insertNotice(NoticeDTO dto)throws Exception{
		return session.insert("adminMapper.insertNotice",dto);
	}
	//공지사항 목록
	public List<NoticeDTO> selectAllNotice()throws Exception{
		return session.selectList("adminMapper.selectAllNotice");
	}
	//공지사항 상세보기
	public NoticeDTO selectOneNotice(int notice_seq)throws Exception{
		return session.selectOne("adminMapper.selectOneNotice",notice_seq);
	}
	//조회수 올리기
	public void updateView(int notice_seq)throws Exception{
		session.update("adminMapper.updateView",notice_seq);
	}
	//수정
	public int noticeUpdate(NoticeDTO dto)throws Exception{
		return session.update("adminMapper.noticeUpdate",dto);
	}
	public int noticeDelete(int notice_seq)throws Exception{
		return session.delete("adminMapper.noticeDelete",notice_seq);
	}
}
