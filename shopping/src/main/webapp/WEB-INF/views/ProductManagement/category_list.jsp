<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- cate_list.jsp -->
<html>
<head>
	<title>카테고리목록</title>
	<script type="text/javascript"> 
	function checkDel(cnum){
		var isDel = window.confirm("정말로 삭제하시겠습니까?");
		if (isDel){
			location.href="/shopping/category_delete?cnum="+cnum;
		} 
	}
</script>
</head>
<body>
<button type="button" onclick="location.href='/shopping/goodsManage'">뒤로가기</button>
<div align="center">
	<table border="1" width="500">
		<caption valign="top"><h2>카테고리 목록</h2></caption>
		<tr bgcolor="yellow">
			<th>번호</th>
			<th>카테고리코드</th>
			<th>카테고리이름</th>
			<th>수정|삭제</th>
		</tr> 
		
		<c:if test="${empty listCategory}">
		<tr>
			<td colspan="6">등록된 카테고리가 없습니다.</td>
		</tr>		
	</c:if>		
	<c:forEach var="vo" items="${listCategory}">
		<tr>
			<td>${vo.cnum}</td>
			<td>${vo.code}</td>
			<td>${vo.cname}</td>
			<td>
				<a href="/shopping/category_edit?cnum=${vo.cnum}">수정</a>
				<a href="javascript:checkDel('${vo.cnum}')">삭제</a>
			</td>
		</tr>		
	</c:forEach>
	</table>


		<c:if test="${pc.prev}">
		<a class="page-link" href="/shopping/category_list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}" 
			style=" margin-top: 0; heght: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">이전</a>
		</c:if>
		<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
			<a href="/shopping/category_list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link" style="margin-top: 0; height: 40px;">${pageNum}</a>
		</c:forEach>
		<c:if test="${pc.next}">
		<a class="page-link" href="/shopping/category_list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}" 
		style=" margin-top: 0; height: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">다음</a>
		</c:if>
</div>
</body>
</html>
