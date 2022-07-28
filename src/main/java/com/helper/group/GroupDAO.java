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
	
	public List<GroupDTO> selectByName(String group_title, String group_std_key) throws Exception {
		if (group_title.equals("") && group_std_key.equals("")) {
			return session.selectList("groupMapper.selectAll");
		} else if (group_std_key.equals("")) {
			return session.selectList("groupMapper.selectByName", group_title);
		} else if (group_title.equals("")) {
			return session.selectList("groupMapper.selectByCategory", group_std_key);
		} else {
			GroupDTO dto = new GroupDTO(0, 0, group_title, "", group_std_key, 0, 0, "");
			return session.selectList("groupMapper.selectByNameCategory", dto);
		}
	}
	
	public GroupDTO selectBySeq(int group_seq) throws Exception {
		return session.selectOne("groupMapper.selectBySeq", group_seq);
	}
	
	public void modify(GroupDTO dto) throws Exception {
		session.update("groupMapper.modify", dto);
	}
	
	public void delete(int group_seq) throws Exception {
		session.delete("groupMapper.delete", group_seq);
	}
}
