package com.helper.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helper.member.MemberDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession session;
	
	public List<MemberDTO> selectBlacklist(int start, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("adminMapper.selectBlacklist", map);
	}
	
	public Map<String, Object> getBlacklistPageNavi(int curPage) throws Exception {
		
		int totalCnt = session.selectOne("adminMapper.blacklistPage"); // 전체 게시글 개수
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
