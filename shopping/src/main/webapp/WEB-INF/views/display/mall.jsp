<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="mall_top.jsp"%>
<div align="center">
	<hr color="green" width="300">
	<h2> H I T</h2>
	<hr color="green" width="300">
	<c:if test="${empty viewGoods.HIT}">
		<h3>HIT상품이 없습니다</h3>
	</c:if>
 	<c:if test="${not empty viewGoods.HIT}">
 		<table width="800" border="0" align="center">
 			<c:set var="co" value="1"/>
 			<tr>
				<c:forEach var="vo" items="${viewGoods.HIT}">
					<td align="center">
						<img src="images/${vo.pimage}" width="80" height="60"><br>
						${vo.pname}<br>
						<font color="red">${vo.price}</font>원<br>
						<font color="blue">${vo.point}</font>point
					</td>
					<c:set var="co" value="${co+1}"/>
					<c:if test="${co>3}">
						</tr><tr>
						<c:set var="co" value="1"/>
					</c:if>	
				</c:forEach>
			</tr>	
		</table>
	</c:if>
<hr color="green" width="300">
	<h2>N E W</h2>
	<hr color="green" width="300">
	<c:if test="${empty viewGoods.NEW}">
		<h3>NEW상품이 없습니다</h3>
	</c:if>
 	<c:if test="${not empty viewGoods.NEW}">
 		<table width="800" border="0" align="center">
 			<c:set var="co" value="1"/>
 			<tr>
				<c:forEach var="vo" items="${viewGoods.NEW}">
					<td align="center">
						<img src="images/${vo.pimage}" width="80" height="60"><br>
						${vo.pname}<br>
						<font color="red">${vo.price}</font>원<br>
						<font color="blue">${vo.point}</font>point
					</td>
					<c:set var="co" value="${co+1}"/>
					<c:if test="${co>3}">
						</tr><tr>
						<c:set var="co" value="1"/>
					</c:if>	
				</c:forEach>
			</tr>	
		</table>
	</c:if>
	<hr color="green" width="300">
	<h2>S A L E</h2>
	<hr color="green" width="300">
	<c:if test="${empty viewGoods.SALE}">
		<h3>SALE상품이 없습니다</h3>
	</c:if>
 	<c:if test="${not empty viewGoods.SALE}">
 		<table width="800" border="0" align="center">
 			<c:set var="co" value="1"/>
 			<tr>
				<c:forEach var="vo" items="${viewGoods.SALE}">
					<td align="center">
						<img src="images/${vo.pimage}" width="80" height="60"><br>
						${vo.pname}<br>
						<font color="red">${vo.price}</font>원<br>
						<font color="blue">${vo.point}</font>point
					</td>
					<c:set var="co" value="${co+1}"/>
					<c:if test="${co>3}">
						</tr><tr>
						<c:set var="co" value="1"/>
					</c:if>	
				</c:forEach>
			</tr>	
		</table>
	</c:if>
</div>
<%@ include file="mall_bottom.jsp"%>