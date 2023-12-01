<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		
		function check(){
			
			if (f.name.value==""){
				alert("이름을 입력해 주세요")
				f.name.focus()
				return false
			}
			if (f.tel.value==""){
				alert("전화번호를 입력해 주세요")
				f.tel.focus()
				return false
			}
			
			if (f.id.value==""){
				alert("아이디를 입력해 주세요")
				f.id.focus()
				return false
			}
			if (f.password.value==""){
				alert("변경할 비밀번호를 입력해 주세요")
				f.content.focus()
				return false
			}
			
			return true
		}
	</script>
<%@ include file="mall_top.jsp"%>
<div class="col-lg-9">
	<div align="center">
		<hr color="green" width="300">
		<h2>비밀번호 변경</h2>
		<hr color="green" width="300">
		<form name="f" action="/shopping/searchPw" method="post"
								onsubmit="return check()">
			<table border="1" width="500" class="table caption-top">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td><input type="text" name="password"></td>
				</tr>		
				<tr>
					<td colspan="2" align="right">
						<input type="submit" class="btn btn-outline-primary" value="비밀번호 변경">
						<input type="reset" class="btn btn-outline-primary" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
</div>
</section>

<%@ include file="mall_bottom.jsp"%>