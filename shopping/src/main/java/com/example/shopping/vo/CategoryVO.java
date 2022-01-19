package com.example.shopping.vo;


//카테고리 클래스
public class CategoryVO {
	
	private int cnum;
	private String code;
	private String cname;
	
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [cnum=" + cnum + ", code=" + code + ", cname=" + cname + "]";
	}
	
	
	
	
}
