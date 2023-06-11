<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- content.jsp -->
<html>
<head>
	<title>글내용보기</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		function check(){
			if (f.content.value==""){
				alert("내용을 입력해 주세요")
				f.content.focus()
				return false
			}
			
			return true
		}
	</script>
</head>
<body>
<div class="jumbotron text-center">
	<h1 class="text-secondary">${getBoard.subject}</h1>
</div>
<div align="center">
	<%--<b>글내용 보기</b>--%>
	<table border="1" width="600" class="table caption-top">
		<tr>
			<th width="20%">글번호</th>
			<td align="center" width="30%">${getBoard.num}</td>
			<th width="20%">조회수</th>
			<td align="center" width="30%">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th width="20%">작성자</th>
			<td align="center" width="30%">${getBoard.writer}</td>
			<th width="20%">아이디</th>
			<td align="center" width="30%">${getBoard.id}</td>
		</tr>
		
		<tr>
			<th width="20%">글제목</th>
			<td width="80%" colspan="3">
				${getBoard.subject}
			</td>
		</tr>
		<tr>
			<th width="20%">글내용</th>
			<td width="80%" colspan="3">
				${getBoard.content}
			</td>
		</tr>
		<tr >
			<td colspan="4" align="right">
				<c:if test="${login.id == getBoard.id}">
					<input type="button" class="btn btn-outline-primary" value="글수정"
										onclick="window.location='/shopping/board/update?num=${getBoard.num}'">
					<input type="button" class="btn btn-outline-primary" value="글삭제"
										onclick="window.location='/shopping/board/delete?num=${getBoard.num}'">
				</c:if>
				<input type="button" class="btn btn-outline-primary" value="글목록"
									onclick="window.location='/shopping/board/list'">
			</td>
		</tr>
	</table>
	

	<table border="1" class="table caption-top">
		<%--<caption>댓글 목록</caption>--%>
		<tr>
				<th>작성자</th>
				<th>내용</th>
				<%--<th>작성일</th>--%>
				<th>삭제</th>
		</tr>
	 <c:if test="${empty getComment}">
		<tr>
			<td colspan="3">등록된 댓글이 없습니다.</td>
		</tr>		
	 </c:if>
	<c:forEach var="vo" items="${getComment}">
		<tr>
			<td>${vo.writer}</td>
			<td>${vo.content}</td>
			<%--<td> <fmt:formatDate pattern = "yyyy/MM/dd" value="${vo.regDate}"/> </td>--%>
			<td><a href="/shopping/board/deleteComment?cno=${vo.cno}">삭제</a></td>
		</tr>
	</c:forEach>
	
	</table>
		<br>
	<c:if test="${!empty loginAdmin}">
		<form name="f" method="post" action="/shopping/board/writeComment" onsubmit="return check()">
		
			<p>
				<label>작성자</label> <input type="text" name="writer" value="관리자" readonly>
			</p>
			<p>
				<textarea rows="5" cols="50" name="content"></textarea>
				<input type="hidden" name="bno" value="${getBoard.num}">
			</p>
			<p>
				<button type="submit" class="btn btn-outline-primary">댓글 작성</button>
			</p>
		</form>
	</c:if>
	
</div>
<div class="jumbotron text-center mt-5 mb-0">
	<h3 class="text-secondary">Shopping-Mall</h3>
	<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
</div>
</body>
</html>









