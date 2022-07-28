package com.helper.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.helper.member.MemberDTO;

@Service
public class AdminService {

	@Autowired
	private ReportDAO reportDAO;
	@Autowired
	private AdminGroupDAO groupDAO;
	@Autowired
	private RecordDAO recordDAO;
	@Autowired
	private AdminDAO adminDAO;

	/* Main record */
	public List<Map<String, Object>> selectTopMem() throws Exception {
		return recordDAO.selectTopMem();
	}

	public List<Map<String, Object>> selectTopGroup() throws Exception {
		return recordDAO.selectTopGroup();
	}

	/* Report */
	// 블랙리스트 목록
	public List<ReportDTO> reportList(int start, int end) throws Exception {
		return reportDAO.reportList(start, end);
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

	/* Group */
	public List<Map<String, Object>> groupList(int start, int end) throws Exception {
		return groupDAO.groupList(start, end);
	}

	public Map<String, Object> getGroupPageNavi(int curPage) throws Exception {
		return groupDAO.getGroupPageNavi(curPage);
	}

	public void deleteGroup(int group_seq) throws Exception {
		groupDAO.deleteGroup(group_seq);
	}

	public List<MemberDTO> selectBlacklist(int start, int end) throws Exception {
		return adminDAO.selectBlacklist(start, end);
	}

	public Map<String, Object> getBlacklistPageNavi(int curPage) throws Exception {
		return adminDAO.getBlacklistPageNavi(curPage);
	}

	// 차단 해제
	public void unblocking(int mem_seq) throws Exception {
		adminDAO.unblocking(mem_seq);
	}

}
