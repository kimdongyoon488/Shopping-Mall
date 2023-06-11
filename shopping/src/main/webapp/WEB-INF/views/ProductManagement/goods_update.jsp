<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_update.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>상품 수정</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="jumbotron text-center">
	<h1 class="text-secondary">상품 수정</h1>
</div>
<div align="center">
<form name="f" action="/shopping/goodsUpdate2" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pnum" value="${getProduct.pnum}"/>
	<table border="0" width="600" class="table caption-top">
		<%--<caption>상품 수정</caption>--%>
		<tr>
			<th>상품코드</th>
			<td align="left">${getProduct.pcode}</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td align="left"><input type="text" name="pname" value="${getProduct.pname}"></td>
		</tr>
		<tr>
			<th>제조회사</th>
			<td align="left"><input type="text" name="pcompany" value="${getProduct.pcompany}"></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td align="left">
				<img src="images/${getProduct.pimage}" width="60" height="60">
				<input type="file" name="pimage">
				<input type="hidden" name="pimage2" value="${getProduct.pimage}"/>
			</td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td align="left"><input type="text" name="price" value="${getProduct.price}"></td>
		</tr>
		<tr>
			<th>상품스팩</th>
			<td align="left">
				<select name="pspec">
					<c:forTokens var="spec" items="NORMAL,HIT,NEW,SALE" delims=",">
						<c:if test="${spec==getProduct.pspec}">
							<option value="${spec}" selected>${spec}</option>
						</c:if>
						<c:if test="${spec!=getProduct.pspec}">
							<option value="${spec}">${spec}</option>
						</c:if>
					</c:forTokens>
				</select>
			</td>	
		</tr>
		<tr>
			<th>SALE(%)</th>
			<td align="left"><input type="text" name="sale" value="${getProduct.sale}"></td>
		</tr>
		<tr>
			<th>상품소개</th>
			<td align="left">
				<textarea name="pcontent" rows="5" cols="50">${getProduct.pcontent}</textarea>
			</td>
		</tr>
		<tr>
			<th>상품포인트</th>
			<td align="left"><input type="text" name="point" value="${getProduct.point}"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" class="btn btn-outline-primary" value="상품수정">
				<input type="reset" class="btn btn-outline-primary" value="취소">
			</td>
		</tr>			
	</table>
</form>
</div>
<div class="jumbotron text-center mt-5 mb-0">
	<h3 class="text-secondary">Shopping-Mall</h3>
	<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
</div>
</body>
</html>