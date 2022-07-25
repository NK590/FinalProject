package com.helper.planner;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlannerDAO {
	@Autowired
	private SqlSession session;
}
