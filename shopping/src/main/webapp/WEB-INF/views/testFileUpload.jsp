<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="f" action="/shopping/fileUpload" method="post" enctype="multipart/form-data">
		
		이름
		<input type="text" name="name">
		파일명
		<input type="file" name="filename">
		<input type="submit" value="파일업로드">
	</form>
	
</body>
</html>