<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="mall_top.jsp"%>  
	
	<div align="center">
		<h1>로그인</h1>
		<form action="#" method="post">
			아이디: <input type="text" name="id"/><br>
		   비밀번호: <input type="password" name="password"/><br>
			<input type="submit" value="로그인"/> 
			<button type="button" onclick="location.href='/shopping/loginSign'">회원가입</button>
		</form>
		
	</div>
	

<%@ include file="mall_bottom.jsp"%>