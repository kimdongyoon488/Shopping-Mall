package com.example.shopping.vo;

//주문 클래스
public class OrderVO {

	private int num;
	private String member_id;
	private int product_pnum;
	private int qty;
	private String pname;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_pnum() {
		return product_pnum;
	}
	public void setProduct_pnum(int product_pnum) {
		this.product_pnum = product_pnum;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
}
