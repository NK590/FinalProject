package com.helper.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupService {
	@Autowired
	private GroupDAO dao;
	
	public void insert(GroupDTO dto) throws Exception {
		dao.insert(dto);
	}
	
	public List<GroupDTO> selectAll() throws Exception {
		return dao.selectAll();
	}
	
	public List<GroupDTO> selectByName(String group_title, String group_std_key) throws Exception {
		return dao.selectByName(group_title, group_std_key);
	}
	
	public GroupDTO selectBySeq(int group_seq) throws Exception {
		return dao.selectBySeq(group_seq);
	}
	
	public void modify(GroupDTO dto) throws Exception {
		dao.modify(dto);
	}
	
	public void delete(int group_seq) throws Exception {
		dao.delete(group_seq);
	}
}
