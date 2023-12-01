<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- cate_list.jsp -->
<html>
<head>
	<title>카테고리 목록</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

	<script type="text/javascript"> 
	function checkDel(cnum){
		var isDel = window.confirm("정말로 삭제하시겠습니까?");
		if (isDel){
			location.href="/shopping/category_delete?cnum="+cnum;
		} 
	}
</script>

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
	<h1 class="text-secondary">카테고리 목록</h1>
</div>
<%--<button type="button" onclick="location.href='/shopping/goodsManage'">뒤로가기</button>--%>
<div align="center">
	<table border="1" width="500" class="table caption-top">
		<%--<caption valign="top"><h2>카테고리 목록</h2></caption>--%>
		<tr>
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


</div>


<ul class="pagination">
	<c:if test="${pc.prev}">
		<li class="page-item">
			<a class="page-link" href="/shopping/category_list?page=1&countPerPage=${pc.paging.countPerPage}"
			>처음</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="/shopping/category_list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}"
			   >이전</a>
		</li>
	</c:if>
	<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
		<li class="page-item">
			<a class="page-link" href="/shopping/category_list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}">${pageNum}</a>
		</li>
	</c:forEach>
	<c:if test="${pc.next}">
		<li class="page-item">
			<a class="page-link" href="/shopping/category_list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}"
			   >다음</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="/shopping/category_list?page=${pc.totPage}&countPerPage=${pc.paging.countPerPage}"
			>끝</a>
		</li>

	</c:if>
</ul>



<div style="display: inline-block; margin: 0 5px;  float: right;">
	<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/goodsManage'">뒤로 가기</button>
</div>
<div class="jumbotron text-center mt-5 mb-0">
	<h3 class="text-secondary">Shopping-Mall</h3>
	<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
</div>
</body>
</html>
