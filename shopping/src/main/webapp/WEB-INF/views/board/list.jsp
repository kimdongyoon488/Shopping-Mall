<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Q&A 게시판</title>
</head>
<body>
<div align="center">
	<b>Q&A 게시판</b>
	<c:if test="${!empty login}">
	<table border="0" width="800">
		<tr bgcolor="yellow">
			<td><a href="/shopping/">쇼핑몰</a></td>
			<td align="right"><a href="/shopping/board/write">글쓰기</a></td>
		</tr>
	</table>
	</c:if>
	<table border="1" width="800">
		<tr bgcolor="yellow">
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
	
		<c:if test="${pc.prev}"> 
			<a class="page-link" href="/shopping/board/list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}" 
				style=" margin-top: 0; heght: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<a href="/shopping/board/list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link" style="margin-top: 0; height: 40px;">${pageNum}</a>
			</c:forEach>
		<c:if test="${pc.next}">
			<a class="page-link" href="/shopping/board/list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}" 
			style=" margin-top: 0; height: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">다음</a>
		</c:if>
</div>
</body>
</html>
