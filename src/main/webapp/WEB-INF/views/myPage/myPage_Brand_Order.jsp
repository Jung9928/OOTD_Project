<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>브랜드 - 주문 내역</title>
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
        
        <!-- 좌측 aside 메뉴 (BRAND)-->
        <%@ include file="myPage_Brand_Menu.jsp" %>
        
        <section class="main">
            <div class="wrap-section">
                <div class="table-title">Order List</div>
                <table class="order-list">
                    <thead>
                        <tr>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>판매금액</th>
                            <th>주문상태</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="o"> 
                    <tbody>
                        <tr>
                            <td>
                                <div class="product-info">
                                    <span class="product-name">${o.product_name}</span>
                                </div>
                            </td>
                            <td>
                                <div class="order-quantity">${o.order_quantity}</div>
                            </td>
                            <td>
                                <span class="order-no" id="${o.product_no}">${o.order_no}</span>
                            </td>
                            <td class="order-date">${o.order_date}</td>
                            <td class="total-price">${o.total_price}&nbsp;&#8361;</td>
                            <td>
                                <span class="purchase-status" >${o.order_status}</span> <!-- 값(숫자)에 따라 주문상태, 버튼 변경-->
                            </td>
                            <td>
                                <button class="complete-send" id="${o.order_no}" name="${o.product_no}">발송 완료</button>
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
   	
</body>

<script>
	var ps;
    // 모달창 스크립트
    $('.order-no').click(function () {
        $('.modal').fadeIn();
        var a = $(this).text();
	    console.log(a);
        // console.log($(this).text());
    })

    $('.modal').on('click', function (event) {
        if ($(event.target).hasClass('modal')) {
            $('.modal').fadeOut()
        }
    });

    $('.close-icon').click(function () {
        $('.modal').fadeOut();
    })

    // .purchase-status의 값(value)에 따라 배송 상태 텍스트 변경
    $(function () {
        $('.purchase-status').each(function () {
        	
            ps = $(this).text();

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
        
        $('.pagination_r').css('padding-left', '33%');
    })
    
    
      
     $('.complete-send').click(function(){
    	 var orderNo = $(this).attr('id');
    	 var productNo = $(this).attr('name');
    	 console.log("pNo", productNo);
    	 
 		$.ajax({
 			type: "POST",
 			url: "${pageContext.request.contextPath}/myPage/myPage_Brand_Send.mp",
 			data: { "orderNo" : orderNo, "productNo" : productNo}, 

 			success: function(data){
 				if(data == 2){
 					//$(this).parent().siblings().children('.purchase-status').text('구매확정대기');
 					//$(this).hide();
 					location.reload();
                } else {
                	//$(this).parent().siblings().children('.purchase-status').text('결제완료');
                	location.reload();
                }
 			}, 			
 			error: function(){
 				alert('상태 변환 실패!');
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
			data: { "orderNo" : orderNo, "productNo" : productNo }, 

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