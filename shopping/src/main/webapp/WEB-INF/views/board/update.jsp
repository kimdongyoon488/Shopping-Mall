<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- updateForm.jsp -->
<html>
<head>
	<title>글수정</title>
	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("이름을 입력해 주세요!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
				return false
			}
			
			return true
		}
	</script>
</head>
<body>
<div align="center">
	<form name="f" action="/shopping/board/update" method="post" 
													onsubmit="return check()">
	<input type="hidden" name="num" value="${getBoard.num}" />									
	<b>글수정</b>														
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="20%">이 름</th>
			<td><input type="text" name="writer" value="${getBoard.writer}"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">제 목</th>
			<td><input type="text" name="subject" size="50" value="${getBoard.subject}"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">Email</th>
			<td><input type="text" name="email" size="50" value="${getBoard.email}"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">내 용</th>
			<td><textarea rows="11" cols="50" name="content">${getBoard.content}</textarea></td>
		</tr>
				<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" 
									onclick="window.location='/shopping/board/list'">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>







