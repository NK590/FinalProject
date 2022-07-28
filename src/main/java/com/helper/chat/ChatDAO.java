package com.helper.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(ChatDTO dto) throws Exception {
		session.insert("chatMapper.insert", dto);
	}
	
	public List<ChatDTO> selectAllByNum(int group_seq) throws Exception {
		return session.selectList("chatMapper.selectAllByNum", group_seq);
	}
}
