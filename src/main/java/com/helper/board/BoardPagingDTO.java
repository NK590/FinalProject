package com.helper.board;

public class BoardPagingDTO {
	
	private int startNavi ; 
	private int endNavi ; 
	private boolean needPrev ;
	private boolean needNext ; 

	BoardPagingDTO(){}
	
	

	public BoardPagingDTO(int startNavi, int endNavi, boolean needPrev, boolean needNext) {
		super();
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.needPrev = needPrev;
		this.needNext = needNext;
	}



	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public boolean isNeedPrev() {
		return needPrev;
	}

	public void setNeedPrev(boolean needPrev) {
		this.needPrev = needPrev;
	}

	public boolean isNeedNext() {
		return needNext;
	}

	public void setNeedNext(boolean needNext) {
		this.needNext = needNext;
	}

	@Override
	public String toString() {
		return "BoardPagingDTO [startNavi=" + startNavi + ", endNavi=" + endNavi + ", needPrev=" + needPrev
				+ ", needNext=" + needNext + "]";
	}
	
	
	
}
