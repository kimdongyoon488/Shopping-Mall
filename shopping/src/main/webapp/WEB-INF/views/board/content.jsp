<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content.jsp -->
<html>
<head>
	<title>글내용보기</title>
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
</div>
</body>
</html>









