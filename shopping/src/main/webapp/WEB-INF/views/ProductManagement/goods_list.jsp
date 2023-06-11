<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript"> 
	function checkDel(pnum, pimage){
		var isDel = window.confirm("정말로 삭제하시겠습니까?");
		if (isDel){
			location.href="/shopping/goodsDelete?pnum="+pnum + "&pimage="+pimage;
		} 
	}
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<%--<button type="button" onclick="location.href='/shopping/goodsManage'">뒤로가기</button>--%>
<div class="jumbotron text-center">
	<h1 class="text-secondary">상품 목록</h1>
</div>
<div align="center">
<table border="1" width="800" class="table caption-top">
	<%--<caption>상품목록</caption>--%>
	<form action="/shopping/goodsSearch" method="post">
		<select name="condition" class="form-select" aria-label="Default select example">
			<option value="cate">카테고리명</option>
			<option value="name">상품명</option>
			<option value="all">전체상품</option>
		</select>
		&nbsp;
		<input type="text" name="search">
		&nbsp;
		<input type="submit" class="btn btn-outline-primary" value="검색">
	</form>
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>상품코드</th>
		<th>이미지</th>
		<th>가격</th>
		<th>수량</th>
		<th>재고관리</th>
		<th>수정|삭제|</th>
	</tr>
<c:if test="${empty listProduct}">
	<tr>
		<td colspan="7">등록된 상품이 없습니다.</td>
	</tr>		
</c:if>	
<c:forEach var="vo" items="${listProduct}">
	<tr>
		<td>${vo.pnum}</td>
		<td>${vo.pname}</td>
		<td>${vo.pcode}</td>
		<td>
				<img src="images/${vo.pimage}" border="0" width="40" height="40">
		</td>
		<td>${vo.price}</td>
		<td>${vo.pqty}</td>
		<td>
			<a href="/shopping/goods_input?pnum=${vo.pnum}">입고</a> | 
			<a href="/shopping/goods_output?pnum=${vo.pnum}">출고</a>
		</td>
		<td>
			<a href="/shopping/goodsUpdate?num=${vo.pnum}">수정</a>
			<a href="javascript:checkDel('${vo.pnum}','${vo.pimage}')">삭제</a>
		</td>
	</tr>
</c:forEach>
</table>
		
	<c:if test="${not empty pc}">
	
		<c:if test="${pc.prev}"> 
			<a class="page-link" href="/shopping/goodsList?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}" 
				style=" margin-top: 0; heght: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<a href="/shopping/goodsList?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link" style="margin-top: 0; height: 40px;">${pageNum}</a>
			</c:forEach>
		<c:if test="${pc.next}">
			<a class="page-link" href="/shopping/goodsList?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}" 
			style=" margin-top: 0; height: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">다음</a>
		</c:if>
		
	</c:if>
	<div style="display: inline-block; margin: 0 5px;  float: right;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/goodsManage'">뒤로 가기</button>
	</div>
	<div class="jumbotron text-center mt-5 mb-0">
		<h3 class="text-secondary">Shopping-Mall</h3>
		<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
	</div>
</div>
