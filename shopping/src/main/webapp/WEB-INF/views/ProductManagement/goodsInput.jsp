<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_input.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>상품입력</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="jumbotron text-center">
	<h1 class="text-secondary">상품 등록</h1>
</div>
<div align="center">
<form name="f" action="/shopping/goodsInput2" method="post" enctype="multipart/form-data">
	<table border="0" width="600" class="table caption-top">
		<%--<caption>상품 등록</caption>--%>
		<tr>
			<th class="m2">카테고리</th>
			<td align="left">
				<select name="category_fk">
				<c:forEach var="dto" items="${listCategory}">
					<option value="${dto.code}">${dto.cname}[${dto.code}]</option>
				</c:forEach>
				</select>
				
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td align="left"><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td align="left"><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<th>제조회사</th>
			<td align="left"><input type="text" name="pcompany"></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td align="left"><input type="file" name="pimage"></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td align="left"><input type="text" name="price"></td>
		</tr>
		<tr>
			<th>상품스팩</th>
			<td align="left">
				<select name="pspec">
					<option value="NORMAL" selected>::NORMAL::</option>
					<option value="HIT">HIT</option>
					<option value="NEW">NEW</option>
					<option value="SALE">SALE</option>
				</select>
			</td>	
		</tr>
		<tr>
			<th>SALE(%)</th>
			<td align="left"><input type="text" name="sale" value="0"></td>
		</tr>
		<tr>
			<th>상품소개</th>
			<td align="left">
				<textarea name="pcontent" rows="5" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<th>상품포인트</th>
			<td align="left"><input type="text" name="point"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" class="btn btn-outline-primary" value="상품등록">
				<input type="reset" class="btn btn-outline-primary" value="초기화">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/goodsManage'">뒤로 가기</button>
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









