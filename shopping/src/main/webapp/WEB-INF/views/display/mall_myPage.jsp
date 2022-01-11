<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="mall_top.jsp"%>  
	
	<div align="center">
		<h1>내정보</h1>
		아이디 : <input type="text" name="id" value="${login.id}" readonly><br>
		이름 : <input type="text" name="name" value="${login.name}" readonly><br>
		나이 : <input type="number" name="age" value="${login.age}" readonly><br>
		전화번호 : <input type="tel" name="tel" value="${login.tel}" readonly><br>
	<button type="button" onclick="location.href='/shopping/user/update'">회원수정</button><br>
		<h1> 내 주문 목록</h1>
		<table border="1">
			<tr>
				<th>주문상품</th>
				<th>주문수량</th>
				<!--  <th>주문취소</th> -->
			</tr>
			<c:if test="${empty orderList}">
				<tr>
					<td colspan="2">주문하신 상품이 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="vo" items="${orderList}">
				<tr>
					<td>${vo.pname}</td>
					<td>${vo.qty}</td>
					<!-- <td><a href="/shopping/orderDelete?num=${vo.num}">취소</a></td>-->
				</tr>
			</c:forEach>
		</table>
	</div>
	

<%@ include file="mall_bottom.jsp"%>