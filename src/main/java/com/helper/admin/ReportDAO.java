package com.helper.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSession session;
	
	// 신고 등록
	public void insert(ReportDTO dto) throws Exception {
	      session.insert("reportMapper.insert", dto);
	}

	// 전체 신고 목록
	public List<ReportDTO> reportList(int start, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("adminMapper.reportList", map);
	}

	// 블랙리스트 추가
	public int addBlack(int mem_seq) throws Exception {
		session.delete("adminMapper.deleteBlack", mem_seq);
		return session.update("adminMapper.addBlack", mem_seq);
	}

	// 블랙리스트 페이징
	public Map<String, Object> getBlackPageNavi(int curPage) throws Exception {

		int totalCnt = session.selectOne("adminMapper.blackPage"); // 전체 게시글 개수
		int recordCntPerPage = 10; // 한 페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage = 5; // 네비를 몇개 단위로 페이징을 구성할지
		int pageTotalCnt = 0; // 총 몇 페이지

		if (totalCnt % recordCntPerPage > 0) {
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}

		if (curPage < 1) {
			curPage = 1;
		} else if (curPage > pageTotalCnt) {
			curPage = pageTotalCnt;
		}

		int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + (naviCntPerPage - 1);

		if (pageTotalCnt < endNavi) {
			endNavi = pageTotalCnt;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCnt) {
			needNext = false;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);

		return map;
	}

	// 블랙리스트 아이디로 찾기
	public List<ReportDTO> searchMember(String mem_id, int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		return session.selectList("adminMapper.searchById", map);
	}
	
	public Map<String, Object> getSearchPageNavi(String mem_id, int curPage) throws Exception {
		int totalCnt = session.selectOne("adminMapper.searchPage", mem_id); // 전체 게시글 개수
		int recordCntPerPage = 10; // 한 페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage = 5; // 네비를 몇개 단위로 페이징을 구성할지
		int pageTotalCnt = 0; // 총 몇 페이지

		if (totalCnt % recordCntPerPage > 0) {
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}

		if (curPage < 1) {
			curPage = 1;
		} else if (curPage > pageTotalCnt) {
			curPage = pageTotalCnt;
		}

		int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + (naviCntPerPage - 1);

		if (pageTotalCnt < endNavi) {
			endNavi = pageTotalCnt;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCnt) {
			needNext = false;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);

		return map;
	}
	

}
