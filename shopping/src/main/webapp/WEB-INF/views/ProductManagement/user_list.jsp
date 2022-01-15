<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


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
<button type="button" onclick="location.href='/shopping/admin'">뒤로가기</button>
<div align="center">
<table border="1" width="800">
	<caption>회원목록</caption>
	<form name="f" action="/shopping/user/search" method="post" onsubmit="return check()">
		<input type="text" name="id">
		<input type="submit" value="아이디로 검색">		
	</form>
	<tr bgcolor="yellow">
		<th>이름</th>
		<th>아이디</th>
		<th>나이</th>
		<th>전화번호</th>
		<th>가입날짜</th>
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
		<td><fmt:formatDate pattern = "yyyy/MM/dd" value="${vo.joinDate}"/></td>
	</tr>
</c:forEach>
</table>
		
	<c:if test="${not empty pc}">
	
		<c:if test="${pc.prev}"> 
			<a class="page-link" href="/shopping/user/list?page=${pc.paging.page - 1}&countPerPage=${pc.paging.countPerPage}" 
				style=" margin-top: 0; heght: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">이전</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<a href="/shopping/user/list?page=${pageNum}&countPerPage=${pc.paging.countPerPage}" class="page-link" style="margin-top: 0; height: 40px;">${pageNum}</a>
			</c:forEach>
		<c:if test="${pc.next}">
			<a class="page-link" href="/shopping/user/list?page=${pc.paging.page + 1}&countPerPage=${pc.paging.countPerPage}" 
			style=" margin-top: 0; height: 40px; color: black; border: 0px solid #f78f24; opacity: 0.8">다음</a>
		</c:if>
		
	</c:if>
</div>