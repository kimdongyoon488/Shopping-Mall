package com.example.shopping.paging;

//페이징 처리 클래스
public class PageCreator {

	private PageVO paging;
	private int beginPage;
	private int endPage;
	private int totalCount;
	private boolean prev;
	private boolean next;
	
	private final int displayPage = 2;
	
	public void calc() {
		
		endPage = (int)(Math.ceil((double)paging.getPage()/displayPage))*displayPage;
		beginPage = (endPage - displayPage) + 1;
		prev = (beginPage == 1) ? false : true;
		next = (totalCount > (endPage * paging.getCountPerPage())) ? true : false; 
		if(!next) {
			endPage = (int)(Math.ceil((double)totalCount / paging.getCountPerPage()));
		}
	}
	
	public PageVO getPaging() {
		return paging;
	}
	
	public void setPaging(PageVO paging) {
		this.paging = paging;
	}
	
	public int getBeginPage() {
		return beginPage;
	}
	
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calc();
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
	
	
	
	
}
