package com.example.shopping.vo;

//검색 클래스
public class SearchVO {
	
	private String condition;
	private String search;
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	@Override
	public String toString() {
		return "SearchVO [condition=" + condition + ", search=" + search + "]";
	}
	
	
	
	
}
