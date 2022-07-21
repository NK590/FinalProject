package com.helper.month;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MonthService {
	
	@Autowired
	private MonthDAO dao;
	
}
