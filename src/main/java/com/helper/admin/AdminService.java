package com.helper.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	private ReportDAO reportDAO;

	
	/* Report */
	// 블랙리스트 목록
	public List<ReportDTO> reportList(int start, int end) throws Exception {
		return reportDAO.reportList(start,end);
	}
	// 블랙리스트 추가
	public int addBleck(int mem_seq) throws Exception {
		return reportDAO.addBlack(mem_seq);
	}
	// 블랙리스트 페이징
	public Map<String, Object> getBleckPageNavi(int curPage) throws Exception {
		return reportDAO.getBleckPageNavi(curPage);
	}
	// 블랙리스트 유저 아이디로 찾기
	public List<ReportDTO> searchMember(String mem_id, int start, int end) throws Exception {
		return reportDAO.searchMember(mem_id, start, end);
	}
	// 찾기 페이징
	public Map<String, Object> getSearchPageNavi(String mem_id, int curPage) throws Exception {
		return reportDAO.getSearchPageNavi(mem_id, curPage);
	}
	
}
