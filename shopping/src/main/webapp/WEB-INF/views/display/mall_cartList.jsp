<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>  
<table width="99%" border="1" align="center">
	<tr class="m2"> 
		<td colspan="6" align="center">
			<h4>장바구니</h4>
		</td>
	</tr>
	<tr class="m1">
		<th width="10%">번호</th>
		<th width="30%">상품명</th>
		<th width="10%">수량</th>
		<th width="20%">단가</th>
		<th width="20%">금액</th>
		<th width="10%">삭제</th>
	</tr>	
	<c:set var="cartTotalPrice" value="0"/>
	<c:set var="cartTotalPoint" value="0"/>
	<c:if test="${empty cart}">
		<tr>
			<td colspan="6">장바구니가 비었습니다.</td>
		</tr>	
	</c:if>
		
	<c:forEach var="vo" items="${cart}" varStatus="i">
	<tr>
		<!-- index는 0부터 count는 1부터 -->
		<td align="center">${i.count}</td>
		<td align="center">
			<img src="images/${vo.pimage}" width="40" height="40"><br>
			<b>${vo.pname}</b>
		</td>
		<td align="center">
			<form name="f" method="post" action="/shopping/cartEdit">
				<br>
				<input type="text" size="3" name="pqty" value="${vo.pqty}">개
				<input type="hidden" name="index" value="${i.count-1}">
				<input type="submit" value="수정">
			</form>			
		</td>
		<td align="right">
			<b>${vo.price}원<br>
			[${vo.point}] point</b>
		</td>	
		<td align="right">
			<font color="red">
			<b>${vo.price * vo.pqty}원<br>
			[${vo.point*vo.pqty}] point</b>
			</font>
		</td>
		<td align="center">
			<a href="/shopping/cartDelete?index=${i.count-1}">삭제</a>	
		</td>
	</tr>
		<c:set var="cartTotalPrice" value="${cartTotalPrice + vo.price * vo.pqty}"/>
		<c:set var="cartTotalPoint" value="${cartTotalPoint + vo.point * vo.pqty}"/>
	</c:forEach>
	<tr class="m1">
		<td colspan="4"><b>장바구니 총액</b> : 
			<font color="red"><c:out value="${cartTotalPrice}"/>원<br></font>
			<font color="green">총 적립 포인트 : [<c:out value="${cartTotalPoint}"/>] point</font>	
		</td>
		<td colspan="2">
			<a href="#">[주문하기]</a>
			<a href="/shopping/mall">[계속쇼핑]</a>
		</td>
	</tr>			
</table>	
<%@ include file="mall_bottom.jsp"%>










