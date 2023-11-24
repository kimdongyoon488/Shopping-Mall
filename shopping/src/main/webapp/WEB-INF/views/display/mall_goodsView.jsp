<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>
<script type="text/javascript">
	function goCart(){
		document.f.action="/shopping/cartAdd"
		document.f.submit()
	}
	
	function goOrder(){
		document.f.action="/shopping/directOrder"
		document.f.submit()
	}
</script>
<div class="col-lg-9">
	<table width="99%" border="0" class="table caption-top">
		<tr class="m1">
			<td colspan="2" align="center">
				<b>[${getProduct.pname}] 상품 정보</b>
			</td>
		</tr>
		<tr>
			<td align="center" class="m3">
				<img src="images/${getProduct.pimage}" width="200" height="200">
			</td>
			<td class="m3">
				<form name="f" method="post">
					상품번호 : ${getProduct.pnum}<br>
					상품이름 : ${getProduct.pname}<br>
					상품가격 : ${getProduct.price}원<br>
					상품포인트 : [${getProduct.point}]point<br>
					구매할 수량 : <input type="text" name="qty" size="3" value="1" >개<br><br>
					추천 수 : <div>${goodsLike}</div> <br>
					<input type="hidden" name="pnum" value="${getProduct.pnum}">
					<input type="hidden" name="code" value="${param.code}">
					<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='javascript:goCart()'">장바구니에 추가</button>
					<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='javascript:goCart()'">즉시구매</button>
					<%--<a href="javascript:goCart()">장바구니에 추가</a>--%>
					<%--<a href="javascript:goOrder()">즉시구매</a>--%>
					<c:if test="${not empty like}">
						<button type="button" id="likeBtn" class="btn btn-outline-primary btn-sm">추천</button>
					</c:if>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left">
				<b>상품 상세 설명</b><br>
				${getProduct.pcontent}
			</td>
		</tr>
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>

<script type="text/javascript">


		<c:if test="${not empty like}">
			var likeval = ${like};
			let product_num = ${getProduct.pnum};
			let member_id = '${login.id}';



			if(likeval > 0){
				console.log(likeval + "좋아요 누름");
				$('#likeBtn').html("추천 취소");
				$('#likeBtn').click(function() {
					$.ajax({
						type :'post',
						url : '<c:url value ="/likeDown"/>',
						contentType: 'application/json',
						data : JSON.stringify(
								{
									"product_num" : product_num,
									"member_id" : member_id
								}
						),
						success : function(result) {
							location.reload();
						}
					})// 아작스 끝
				})

			}else {
				console.log(likeval + "좋아요 안누름")
				console.log(member_id);
				$('#likeBtn').click(function () {
					$.ajax({
						type: 'post',
						url: '<c:url value ="/likeUp"/>',
						contentType: 'application/json',
						data: JSON.stringify(
								{
									"product_num": product_num,
									"member_id": member_id
								}
						),
						success: function(result) {
							location.reload();
						}
					})// 아작스 끝
				})

			}
		</c:if>
</script>