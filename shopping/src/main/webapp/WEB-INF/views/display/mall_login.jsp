<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		
		function check(){
			if (f.id.value==""){
				alert("아이디를 입력해 주세요")
				f.id.focus()
				return false
			}
			if (f.password.value==""){
				alert("비밀번호를 입력해 주세요")
				f.content.focus()
				return false
			}
			
			return true
		}
	</script>
<%@ include file="mall_top.jsp"%>  
	
	<div align="center">
		<h1>로그인</h1>
		<form name="f" action="/shopping/user/login" method="post"  onsubmit="return check()">
			<c:if test="${empty cookie.saveId.value}">
			아이디: <input type="text" name="id"/><br>
			</c:if>
			<c:if test="${!empty cookie.saveId.value}">
			아이디: <input type="text" name="id" value="${cookie.saveId.value}"/><br>
			</c:if>
		   비밀번호: <input type="password" name="password"/><br> 
		   아이디 기억하기<input type="checkbox" name="saveId"><br>
			<input type="submit" value="로그인"/> 
			<button type="button" onclick="location.href='/shopping/user/loginSign'">회원가입</button>
			<button type="button" onclick="location.href='/shopping/user/searchId'">아이디 찾기</button>
			<button type="button" onclick="location.href='/shopping/user/searchPw'">비밀번호 찾기</button>
		</form>
		
	</div>
	

<%@ include file="mall_bottom.jsp"%>