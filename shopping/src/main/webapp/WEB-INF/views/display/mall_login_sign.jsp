<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		
		function check(){
			if (f.name.value==""){
				alert("이름를 입력해 주세요")
				f.name.focus()
				return false
			}
			if (f.age.value==""){
				alert("나이를 입력해 주세요")
				f.age.focus()
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
				alert("비밀번호를 입력해 주세요")
				f.password.focus()
				return false
			}
			
			return true
		}
	</script>


<%@ include file="mall_top.jsp"%>
<div class="col-lg-9">
	<div align="center">

		<form name="f" action="/shopping/loginSign" method="post" onsubmit="return check()">
			이름: <input type="text" name="name"/><br>
		    나이: <input type="number" name="age"/><br>
		    전화번호:<input type="tel" name="tel"/><br>
		    아이디: <input type="text" name="id"/><br>
		    비밀번호: <input type="password" name="password"/><br>
		   <input type="hidden" name="permission" value="user">
		   <!--   권한: <select name="permission"> 
			    	<option value="user">일반 유저</option>
			    	<option value="admin">관리자</option>
		    	</select> -->
			<input type="submit" class="btn btn-outline-primary btn-sm" value="회원가입"/>
		</form>
		
	</div>
</div>

<%@ include file="mall_bottom.jsp"%>