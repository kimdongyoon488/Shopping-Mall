<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="mall_top.jsp"%>  
	
	<div align="center">
		<h1>회원가입</h1>
		<form action="/shopping/loginSign" method="post">
			이름: <input type="text" name="name"/><br>
		    나이: <input type="number" name="age"/><br>
		    전화번호:<input type="tel" name="phone"/><br>
		    아이디: <input type="text" name="id"/><br>
		    비밀번호: <input type="password" name="password"/><br>
			<input type="submit" value="회원가입"/>
		</form>
		
	</div>
	

<%@ include file="mall_bottom.jsp"%>