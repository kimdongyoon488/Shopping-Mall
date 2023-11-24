<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<script type="text/javascript"> 
	
	function check(){
		if (f.id.value==""){
			alert("검색할 아이디를 입력해 주세요!!")
			f.id.focus()
			return false
		}
		return true
	}
	
</script>

<div class="jumbotron text-center">
	<h1 class="text-secondary">회원 관리</h1>
</div>

<div align="center">
<table border="1" width="800" class="table caption-top">

	<form name="f" action="/shopping/search" method="post" onsubmit="return check()">
		<input type="text" name="id"> &nbsp;
		<input type="submit" class="btn btn-outline-primary" value="아이디로 검색"> &nbsp;
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/shopping/admin'">뒤로 가기</button>
		<br>
	</form>
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>나이</th>
		<th>전화번호</th>
		<%--<th>가입날짜</th>--%>
	</tr>
<c:if test="${empty listUser}">
	<tr>
		<td colspan="7">등록된 회원이 없습니다.</td>
	</tr>		
</c:if>	
<c:forEach var="vo" items="${listUser}">
	<tr>
		<td>${vo.name}</td>
		<td>${vo.id}</td>
		<td>${vo.age}</td>
		<td>${vo.tel}	</td>
		<%--<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${vo.joinDate}"/></td>--%>
	</tr>
</c:forEach>
</table>
		
	<c:if test="${not empty pc}">
	
		<c:if test="${pc.prev}"> 
			<a class="page-link" href="/shopping/list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}"
				style=" margin-top: 0; heght: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<a href="/shopping/list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link" style="margin-top: 0; height: 40px;">${pageNum}</a>
			</c:forEach>
		<c:if test="${pc.next}">
			<a class="page-link" href="/shopping/list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}"
			style=" margin-top: 0; height: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">다음</a>
		</c:if>
		
	</c:if>
</div>

<!-- footer -->
<div class="jumbotron text-center mt-5 mb-0">
	<h3 class="text-secondary">Shopping-Mall</h3>
	<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>