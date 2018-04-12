package com.project.util;

public class Pager {
	
	private int contentNum = 15; // 한페이지에 몇개 표시할지
	private int contentBlock = 5; // 한블럭에 몇개 페이지 표시할지
	
	private int startRow;
	private int endRow;
 	
	private int totalCount; // 전체 게시물의 개수
	private int pageNum; // 현재 페이지 번호
	private int startPage =1; // 현재 페이지 블록의 시작페이지
	private int endPage = 5; // 현재페이지 블록의 마지막 페이지
	private boolean prev = false; // 이전 페이지로 가는 화살표
	private boolean next; // 다음 페이지로 가는 화살표
	private int currentBlock; // 현재 페이지 블록
	private int lastBlock; // 마지막 페이지 블록
	
	
	//전체 페이지 수를 계산
	public int calcPage(int totalCount) {
		
		int totalPage = (int)Math.ceil((double)totalCount / contentNum);
		
		return totalPage;
	}
	
	
	public void prevNext( int pageNum ) {
		
		if ( pageNum >=1 && pageNum <= contentBlock) {
			setPrev(false);
			setNext(true);
			
		}
		
		else if ( currentBlock == lastBlock ) {
			setPrev(true);
			setNext(false);
			
		}
		
		else {
			setPrev(true);
			setNext(true);
			
		}
		
	}
	
	

	public int getTotalCount() {
		return totalCount;
	}
	//컨트롤러에서 세팅
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getContentNum() {
		return contentNum;
	}

	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage() {
		//해당 블럭의 시작 페이지
		this.startPage = (currentBlock-1) * contentBlock + 1;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage() {
		//해당 블럭의 마지막 페이지
		
		//마지막 블럭일때
		if ( lastBlock == currentBlock ) {
			
			this.endPage = calcPage(getTotalCount());
			return;
		}
		
		this.endPage = startPage + (contentBlock-1);
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	//현재페이지번호로 계산
	public void setCurrentBlock(int pageNum) {
		this.currentBlock = ((pageNum-1) / contentBlock) + 1;
		
	}

	public int getLastBlock() {
		return lastBlock;
	}
	
	//마지막 블럭
	public void setLastBlock() {
		
		this.lastBlock = (int)Math.ceil((double)totalCount/(contentBlock*contentNum) );
	}


	public int getContentBlock() {
		return contentBlock;
	}


	public void setContentBlock(int contentBlock) {
		this.contentBlock = contentBlock;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int pageNum) {
		this.startRow = (contentNum * pageNum) - contentNum+1;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int pageNum) {
		this.endRow = contentNum * pageNum;
	}

	
	
	
}
