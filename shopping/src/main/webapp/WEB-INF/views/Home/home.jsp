<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<%--<div align="center"> <h1>관리자 페이지</h1><br> </div>--%>
	<div class="jumbotron text-center">
		<h1 class="text-secondary">Shopping-Mall Admin Page</h1>
	</div>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="list-group">

				<%--<li class="list-group-item"><h3>관리자 메뉴</h3></li>--%>
				<li class="list-group-item list-group-item-light"><h3><a href="/shopping/goodsManage">상품 관리</a></h3></li>

				<li class="list-group-item list-group-item-light"><h3><a href="/shopping/user/list">회원 관리</a></h3></li>

				<li class="list-group-item list-group-item-light"><h3><a href="/shopping/board/list">Q&A게시판 관리</a></h3></li>

			</ul>
		</div>
	</div>
</div>
	<!-- footer -->
	<div class="jumbotron text-center mt-5 mb-0">
		<h3 class="text-secondary">Shopping-Mall</h3>
		<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>