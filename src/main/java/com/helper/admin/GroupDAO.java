package com.helper.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDAO {
	
	private SqlSession session;
	
	public List<GroupDTO> groupList(int start, int end) throws Exception {
		return null;
	}
	
}
