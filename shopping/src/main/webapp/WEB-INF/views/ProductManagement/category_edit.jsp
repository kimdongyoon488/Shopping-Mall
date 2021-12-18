<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cate_edit.jsp -->
<html>
<head>
<title>카테고리수정</title>
</head>
<body>
<div align="center">
<form action="/shopping/category_edit2" method="post">
	<input type="hidden" name="cnum" value="${getCategory.cnum}"/>
	<table border="1" width="400" height="150">
		<h1>카테고리등록</h1>
		<tr>
			<th bgcolor="yellow">카테고리코드</th>
			<td><input type="text" name="code" readOnly value="${getCategory.code}"></td>
		</tr>
		<tr>
			<th bgcolor="yellow">카테고리이름</th>
			<td><input type="text" name="cname" value="${getCategory.cname}"></td>
		</tr>
		<tr bgcolor="orange">
			<td colspan="2" align="center">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>	
</form>
</div>
</body>
</html>