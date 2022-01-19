package com.example.shopping.vo;

import java.util.Date;

//댓글 클래스
public class CommentVO {

	private int cno;
	private int bno;
	private String writer;
	private String content;
	private Date regDate;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", bno=" + bno + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + "]";
	}
	
	
	
	
}
