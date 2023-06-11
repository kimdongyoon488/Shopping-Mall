<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- updateForm.jsp -->
<html>
<head>
	<title>글수정</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
<div class="jumbotron text-center">
	<h1 class="text-secondary">글 수정</h1>
</div>
<div align="center">
	<form name="f" action="/shopping/board/update" method="post" 
													onsubmit="return check()">
	<input type="hidden" name="num" value="${getBoard.num}" />
	<table border="1" width="500" class="table caption-top">
		<tr>
			<th width="20%">이 름</th>
			<td><input type="text" name="writer" value="${getBoard.writer}"></td>
		</tr>
		<tr>
			<th width="20%">제 목</th>
			<td><input type="text" name="subject" size="50" value="${getBoard.subject}"></td>
		</tr>
		<tr>
			<th width="20%">Email</th>
			<td><input type="text" name="email" size="50" value="${getBoard.email}"></td>
		</tr>
		<tr>
			<th width="20%">내 용</th>
			<td><textarea rows="11" cols="50" name="content">${getBoard.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" class="btn btn-outline-primary" value="글수정">
				<input type="reset" class="btn btn-outline-primary" value="다시작성">
				<input type="button" class="btn btn-outline-primary" value="목록보기"
									onclick="window.location='/shopping/board/list'">
			</td>
		</tr>
	</table>
	</form>
</div>
<div class="jumbotron text-center mt-5 mb-0">
	<h3 class="text-secondary">Shopping-Mall</h3>
	<p>Shopping-Mall Homepage is powered by <span class="text-primary">DONGYOON</span> / Designed by <span class="text-primary">DONGYOON</span></p>
</div>
</body>
</html>







