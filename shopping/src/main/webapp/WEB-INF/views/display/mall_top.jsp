<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>쇼핑몰</title>
	<script type="text/javascript">
		function nextPage(var1, var2){
			document.cgList.action = "/shopping/mall_categoryList";
			document.cgList.code.value = var1;
			document.cgList.cname.value = var2;
			document.cgList.submit();
		}
	</script>
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<form name="cgList" method="post">
		<input type="hidden" name="code">
		<input type="hidden" name="cname">
	</form>
	<div class="jumbotron text-center mb-0">
		<h1>Shopping Mall</h1>
	</div>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<a href="/shopping/" class="navbar-brand">쇼핑몰</a>
		<!-- Toggle Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<c:if test="${!empty login}"><li class="nav-item"><a href="/shopping/cartList" class="nav-link">장바구니</a></li></c:if>
				<c:if test="${empty login}"><li class="nav-item"><a href="/shopping/user/login" class="nav-link">로그인</a></li></c:if>
				<c:if test="${!empty login}"><li class="nav-item"><a href="/shopping/user/logout" class="nav-link">로그아웃</a></li></c:if>
				<c:if test="${!empty login}"><li class="nav-item"><a href="/shopping/board/list" class="nav-link">문의하기</a></li></c:if>
				<c:if test="${!empty login}"><li class="nav-item"><a href="/shopping/myPage" class="nav-link">마이페이지</a></li></c:if>
			</ul>
		</div>
	</nav>

	<div class="container pt-3">
		<div class="row">
			<div class="col-sm-4">
				<h3>카테고리</h3>
				<ul class="list-group">
					<c:forEach var="cdto" items="${listCategory}">
						<li class="list-group-item list-group-item-action"><a href="javascript:nextPage('${cdto.code}','${cdto.cname}')"> ${cdto.cname}[${cdto.code}] </a> </li>
					</c:forEach>
				</ul>
			</div>
	<div class="col-sm-8">

	<%--<div align="center">
		<table border="1" width="800" height="600">
			<tr height="10%">
				<td align="center" colspan="2"><a href="/shopping/">쇼핑몰</a> | 
				<c:if test="${!empty login}"><a href="/shopping/cartList">장바구니|</a></c:if>
				<c:if test="${empty login}"> <a href="/shopping/user/login">로그인</a>| </c:if> 
				<c:if test="${!empty login}"> <a href="/shopping/user/logout">로그아웃</a>|</c:if>
				<c:if test="${!empty login}"> <a href="/shopping/board/list">문의하기|</a></c:if>  
				<c:if test="${!empty login}"> <a href="/shopping/myPage">마이페이지</a> </c:if> </td>
			</tr>
			<tr>
				<td width="20%" align="center" valign="top">
					<font size="3">카테고리</font><br>
					<table border="1">
						<c:forEach var="cdto" items="${listCategory}">
							<tr>
								<td align="center">
									<a href="javascript:nextPage('${cdto.code}','${cdto.cname}')">
										${cdto.cname}[${cdto.code}]
									</a>
								</td>
							</tr>
						</c:forEach>	
					</table>
				</td>		
				<td>--%>
								