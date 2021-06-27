<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>결제 완료 페이지</title>
 	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/paymentSuccess.css"/>
	 <c:import url="../common/styler.jsp"/>
</head>

<body>
<c:import url="../common/header.jsp"/>
<div id="backbody">
	<div id="frame1" style="align: center;">
		<div>
			<div id="frame2">
				<span style="font-size:15pt; font-weight: bold;">주문 완료</span>
				<span class="home">장바구니&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;주문서 작성&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<b>주문 완료</b></span>
			</div>

			<div>
				<table class="calculation1" style="margin-top:20px; height: 350px;">
				<thead>
					<tr>
						<th colspan="10" style="text-align: center; padding-left: 10px; padding-top: 20px;">
							<span style="font-size: 30px;"><img src="${pageContext.request.contextPath }/resources/images/check.PNG" style="width: 60px;"/>주문이 완료되었습니다!</span><br />
							<span style="font-size: 17px;">주문번호 : ${order.order_no }</span><br />
							<span style="font-size: 17px;">주문일자 : ${order.order_date }</span>
						</th>
					</tr>
				</thead>
				</table>
			</div>

			<table class="delivery">
				<thead>
					<tr>
						<th colspan="10">배송지 정보</th>
					</tr>
						
					<tr>
						<td class="deliverytd" style="width: 100px;">수령인</td>
						<td>${order.receiver_name }</td>
					</tr>
					
					<tr>
						<td class="deliverytd">주소</td>
						
						<td>
							${order.order_address }
						</td>
					</tr>
					
					<tr>
						<td class="deliverytd" style="border-bottom: solid 1px #e0e0eb; padding-bottom:30px;">배송메모</td>
						<td style="border-bottom: solid 1px #e0e0eb; padding-bottom:30px;">						
							${order.order_memo }
						</td>
					</tr>
				</thead>
			</table>
			<br /><br />
				
			<table class="delivery">
				<thead>
					<tr>
						<th colspan="10" style="text-align: left; padding-left: 10px; color: gray; padding-top: 30px; padding-bottom: 30px; border-bottom: solid 1px white;">결제정보</th>
					</tr>
						
					<tr>
						<td class="deliverytd" style="width: 100px;">결제방법</td>
						<td>카드결제</td>
					</tr>
					
					<tr>
						<td class="deliverytd" style="border-bottom: solid 1px #e0e0eb; padding-bottom:30px;">결제금액</td>
						<td style="border-bottom: solid 1px #e0e0eb; padding-bottom:30px;">						
							<fmt:formatNumber value="${order.total_price }" pattern="#,###"/>&nbsp;원
						</td>
					</tr>					
				</thead>
			</table>
			<div class="buttonArea">
				<button class="btn orBtn goToMain" id="" type="button">main</button>
				<button class="btn orBtn orderList" id="" type="button">order list</button>
			</div>
		</div>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
<script>
	$('.goToMain').click(function(){
		location.href="${pageContext.request.contextPath }/"
	})
	
	$('.orderList').click(function(){
		location.href="${pageContext.request.contextPath }/myPage/myPage_Purchased.mp"
	})

</script>


</html>