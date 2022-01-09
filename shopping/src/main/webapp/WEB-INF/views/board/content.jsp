<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- content.jsp -->
<html>
<head>
	<title>글내용보기</title>
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
<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="600">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td align="center" width="30%">${getBoard.num}</td>
			<th bgcolor="yellow" width="20%">조회수</th>
			<td align="center" width="30%">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작성자</th>
			<td align="center" width="30%">${getBoard.writer}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글제목</th>
			<td width="80%" colspan="3">
				${getBoard.subject}
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글내용</th>
			<td width="80%" colspan="3">
				${getBoard.content}
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="글수정"
									onclick="window.location='/shopping/board/update?num=${getBoard.num}'">
				<input type="button" value="글삭제"
									onclick="window.location='/shopping/board/delete?num=${getBoard.num}'">
				<input type="button" value="글목록" 
									onclick="window.location='/shopping/board/list'">
			</td>
		</tr>
	</table>
	
	<p>댓글 목록</p>
	<table border="1">
		<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>작성일</th>
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
			<td> <fmt:formatDate pattern = "yyyy/MM/dd" value="${vo.regDate}"/> </td>
			<td><a href="/shopping/board/deleteComment?cno=${vo.cno}">삭제</a></td>
		</tr>
	</c:forEach>
	
	</table>
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
				<button type="submit">댓글 작성</button>
			</p>
		</form>
	</c:if>
	
</div>
</body>
</html>









