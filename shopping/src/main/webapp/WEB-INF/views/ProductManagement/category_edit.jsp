<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cate_edit.jsp -->
<html>
<head>
<title>카테고리수정</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="jumbotron text-center">
	<h1 class="text-secondary">카테고리 수정</h1>
</div>
<div align="center">
<form action="/shopping/category_edit2" method="post">
	<input type="hidden" name="cnum" value="${getCategory.cnum}"/>
	<table border="1" width="400" height="150" class="table caption-top">
		<%--<h1>카테고리등록</h1>--%>
		<tr>
			<th>카테고리 코드</th>
			<td><input type="text" name="code" readOnly value="${getCategory.code}"></td>
		</tr>
		<tr>
			<th>카테고리 이름</th>
			<td><input type="text" name="cname" value="${getCategory.cname}"></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" class="btn btn-outline-primary" value="수정">
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