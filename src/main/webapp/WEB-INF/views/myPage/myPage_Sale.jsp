<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 판매내역</title>
    <script src="${pageContext.request.contextPath }/resources/asset/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order_Detail.css">
    <c:import url="../common/styler.jsp"/>
</head>

<body>

	<!-- HEADER IMPORT -->
	<c:import url="../common/header.jsp"/>


    <div class="container-myPage">
        <div class="body-title">MY PAGE</div>
        
        <!-- 마이페이지 메뉴 (일반) -->
        <%@ include file="myPage_Menu.jsp"%>        

        <section class="main">
            <div class="wrap-section" style="justify-content: center; align-items: center;">
                <div class="table-title">판매 내역</div>
                <table class="sale-table">
                    <thead>
                        <tr>
                            <th>상품정보</th>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>판매금액</th>
                            <th>주문상태</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach items="${list }" var="s">
                    <tbody>
                        <tr>
                            <td>
                                <div class="product-info">
                                    <div class="brand-name">${s.brand_name }</div>
                                    <span class="product-name">${s.product_name } </span>
                                    <span class="product-option">${s.product_size }</span>
                                </div>
                            </td>
                            <td>
                                <div class="order-no" id="${s.product_no}">${s.order_no }</div>
                            </td>
                            <td class="order-date">${s.order_date }</td>
                            <td class="total-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${s.total_price}" />&#8361;</td>
                            <td>
                                <span class="sale-status">${s.order_status }</span> <!-- 값(숫자)에 따라 주문상태, 버튼 변경-->
                            </td>
                            <td>
                                <button class="modify-product modify" style="display: none;">수정</button>
                                <button class="delete-product delete" style="display: none;">삭제</button>
                                <button class="complete-send" style="display: none;" id="${s.order_no }">발송완료</button>
                            </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
                <c:out value="${pageBar}" escapeXml="false"/>
            </div>
        </section>
    </div>
    
    <!-- Order Detail(Mordal) -->
    <%@ include file="myPage_Order_Detail.jsp"%>
    
            
    <!-- FOOTER IMPORT -->
   	<%@ include file="../common/footer.jsp" %>
   	

<script>
	
    // .sale_status의 값(value)에 따라 배송 상태 텍스트 변경
    $(function () {
    	// $('.pagination_r').css('padding-left', '35%');
    	
        $('.sale-status').each(function () {

            var ps = $(this).text();
			
            compSend = $(this).parent().next().children('.complete-send');

            switch (ps) {
                case "1":
                    $(this).text('결제완료');
                    compSend.show();
                    break;
                case "2":
                    $(this).text('구매확정대기');
                    break;
                case "3":
                    $(this).text('거래완료');
                    break;
                case "4":
                    $(this).text('거래완료');
                    break;
            }
        })
    })
	
    // 판매상태 바꾸기
  	$('.complete-send').click(function() {
		
		var orderNo = $(this).attr('id');
		
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/myPage/orderStatusChange.do",
			data: {"orderNo": orderNo},
			
			success: function(data) {
				if(data == 2) {
					$('.sale-status').text("구매확정대기");
					$('.complete-send').hide();
				} else if (data == 3) {
					$('.sale-status').text("거래완료");
					$('.complete-send').hide();
				}
			}, error: function() {
				alert("상태변환 실패");
			}
		});
		
	});
    
    // 주문 번호를 클릭했을 때(span의 class가져옴)
	 $('.order-no').click(function(){
		 
		 var orderNo = $(this).text();
		 console.log(orderNo);
		 var productNo = $(this).attr('id');
    	 console.log("pNo", productNo);
		 
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/myPage/myPage_Order_Detail.mp",
			data: { "orderNo" : orderNo, "productNo": productNo }, 

			success: function(data){
				//alert('주문 상세보기 성공');
				console.log(data[0].order_no);
				console.log(data[0].receiver_name);
				console.log(data[0].order_date); // ? error
				$('.order-no-area>span.order-no').text(data[0].order_no);
				$('.customer-name').text(data[0].receiver_name);
				$('.customer-address').text(data[0].order_address);
				// $('.customer-phone').text(data[0].order_address);
				$('.modal-product>span.product-name').text(data[0].product_name);
				$('.customer-address').text(data[0].order_address);
				$('.modal-date>div.order-date').text(data[0].order_date);
				$('.modal-quantity>div.order-quantity').text(data[0].order_quantity);
				$('.price-area>span.price-amount').text(data[0].total_price);
			},
			
			error: function(){
				alert('주문 상세보기 실패');
			}
			
		});
	}); 



</script>

</html>