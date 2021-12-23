package com.example.shopping.paging;


public class PageCreator {

	private PageVO paging;
	private int beginPage;
	private int endPage;
	private int totalCategory;
	private boolean prev;
	private boolean next;
	
	private final int displayPage = 4;
	
	public void calc() {
		
		endPage = (int)(Math.ceil((double)paging.getPage()/displayPage))*displayPage;
		beginPage = (endPage - displayPage) + 1;
		prev = (beginPage == 1) ? false : true;
		next = (totalCategory > (endPage * paging.getCountPerPage())) ? true : false; 
		if(!next) {
			endPage = (int)(Math.ceil((double)totalCategory / paging.getCountPerPage()));
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
	
	public int getTotalCategory() {
		return totalCategory;
	}
	
	public void setTotalCategory(int totalCategory) {
		this.totalCategory = totalCategory;
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
