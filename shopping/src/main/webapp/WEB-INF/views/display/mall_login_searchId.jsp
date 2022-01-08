<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
		
		
		function check(){
			if (f.name.value==""){
				alert("이름을 입력해 주세요")
				f.name.focus()
				return false
			}
			if (f.tel.value==""){
				alert("전화번호를 입력해 주세요")
				f.tel.focus()
				return false
			}
			
			return true
		}
	</script>

<%@ include file="mall_top.jsp"%>  
	
	
	<div align="center">
		<hr color="green" >
		<h2>아이디 찾기</h2>
		<hr color="green">
		<form name="f" action="/shopping/user/searchId" method="post" 
								onsubmit="return check()">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="아이디 찾기">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>


<%@ include file="mall_bottom.jsp"%>