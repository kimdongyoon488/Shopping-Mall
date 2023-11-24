<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Q&A 게시판</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<style type="text/css">
		ul {
			width: 200px;
			margin: 0px auto;
			text-align: center !important;
		}
	</style>
</head>
<body>
<div class="jumbotron text-center">
	<h1 class="text-secondary">Q&A 게시판</h1>
</div>
<div align="center">
	<%--<b>Q&A 게시판</b>--%>
	<%--<c:if test="${!empty login}">
	<table border="0" width="800">
		<tr>
			<td><a href="/shopping/">쇼핑몰</a></td>
			<td align="right"><a href="/shopping/board/write">글쓰기</a></td>
		</tr>
	</table>
	</c:if>--%>
	<table border="1" width="800"  class="table caption-top">
		<tr>
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>

	<c:if test="${empty listBoard}">

		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>		
	</c:if>		
	<c:forEach var="vo" items="${listBoard}">
		<tr>
			<td>${vo.num}</td>
			<td>
				<a href="/shopping/board/content?num=${vo.num}">
					${vo.subject}
				</a>
			</td>
			<td>${vo.writer}</td>
			<td>${vo.readcount}</td>
		
		</tr>		
	</c:forEach>
	</table>

		<%--<c:if test="${pc.prev}">
			<a class="page-link" href="/shopping/board/list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}"
				style=" margin-top: 0; heght: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<a href="/shopping/board/list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link" style="margin-top: 0; height: 40px;">${pageNum}</a>
			</c:forEach>
		<c:if test="${pc.next}">
			<a class="page-link" href="/shopping/board/list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}"
			style=" margin-top: 0; height: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">다음</a>
		</c:if>--%>
		<ul class="pagination">
			<c:if test="${pc.prev}">
				<li class="page-item">
					<a class="page-link" href="/shopping/board/list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}"
					>이전</a>
				</li>
			</c:if>
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<li class="page-item">
					<a class="page-link" href="/shopping/board/list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}">${pageNum}</a>
				</li>
			</c:forEach>
			<c:if test="${pc.next}">
				<li class="page-item">
					<a class="page-link" href="/shopping/board/list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}"
					>다음</a>
				</li>
			</c:if>
		</ul>
</div>



<c:if test="${empty login}">
	<div style="display: inline-block; margin: 0 5px;  float: right;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/admin'">뒤로 가기</button>
	</div>
</c:if>
<c:if test="${!empty login}">
<div style="display: inline-block; margin: 0 5px;  float: right;">
	<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/board/write'">글쓰기</button>
	<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/'">뒤로 가기</button>
</div>
</c:if>
<div class="jumbotron text-center mt-5 mb-0">
	<h3 class="text-secondary">Shopping-Mall</h3>
	<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
</div>
</body>
</html>
