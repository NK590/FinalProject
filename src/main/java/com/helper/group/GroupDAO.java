package com.helper.group;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(GroupDTO dto) throws Exception {
		session.insert("groupMapper.insert", dto);
	}
	
	public List<GroupDTO> selectAll() throws Exception {
		return session.selectList("groupMapper.selectAll");
	}
	
	public GroupDTO selectBySeq(int group_seq) throws Exception {
		return session.selectOne("groupMapper.", group_seq);
	}
	
	public void modify(GroupDTO dto) throws Exception {
		session.update("groupMapper.modify", dto);
	}
	
	public void delete(int group_seq) throws Exception {
		session.delete("groupMapper.delete", group_seq);
	}
}
