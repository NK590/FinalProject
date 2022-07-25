package com.helper.board;

public class BoardPagination {

	// BoardPagingDTO 객체를 리턴하는 static 메소드

	public static BoardPagingDTO getPageInfo(int curPage, int totalCnt) {

		BoardPagingDTO bpt = null;

		int recordCntPerPage = 10; // 한 페이지에 몇개의 게시글을 띄워줄지 개수 지정
		int naviCntPerPage = 10; // 네비바를 몇개 단위로 페이징을 구성할지
		int pageTotalCnt = 0; // 총 몇 페이지가 나올지

		// 총 페이지 개수 구하기
		if (totalCnt % recordCntPerPage > 0) {// 나머지가 생김(10의 배수가 아님x)
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}
		// 현재 페이지는 총 페이지의 개수를 넘어 갈 수 없다. 
		if (curPage < 1) { // 현재페이지가 0 도는 음수 일때 무조건 첫 페이지로 맞춰주기
			curPage = 1;
		} else if (curPage > pageTotalCnt) { // 현재 페이지가 pageTotalCnt보다 크면 pageTotal 값을 준다.
			curPage = pageTotalCnt;
		}
		// 네비의 시작페이지, 끝페이지 
		int startNavi = ((curPage -1) / naviCntPerPage) * naviCntPerPage + 1 ;
		int endNavi = startNavi + naviCntPerPage - 1;
		// endNavi가 전체페이지 넘어갈 수 없음
		if(pageTotalCnt < endNavi) { // endNavi가 전체페이지수 보다 크다면  
			endNavi = pageTotalCnt; // endNavi를 마지막 페이지로 수정해주겠다.
		}
		
		boolean needPrev = true; // startNavi가 1일때 needPrev가 false
		boolean needNext = true; // endNavi가 마지막페이지(전체페이지)의 값일때 needNext가 false
					
					if(startNavi == 1) {
						needPrev = false;
					}
					if(endNavi == pageTotalCnt) {
						needNext =false;
					}
	 return bpt = new BoardPagingDTO(startNavi, endNavi,needPrev, needNext);
	}
}











