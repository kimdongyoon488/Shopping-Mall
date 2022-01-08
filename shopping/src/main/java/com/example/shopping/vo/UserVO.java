package com.example.shopping.vo;

import java.util.Date;

public class UserVO {
	
	private String id;
	private String password;
	private int age;
	private String tel;
	private String name;
	private Date joinDate;
	private String permission;
	
	 public UserVO() {
		this.age = 0;
	}
	
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", age=" + age + ", tel=" + tel + ", name=" + name
				+ ", joinDate=" + joinDate + ", permission=" + permission + "]";
	}
	
	
}
