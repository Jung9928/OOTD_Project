<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 상품리스트</title>
    <script src="${pageContext.request.contextPath }/resources/asset/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage.css">

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
                <div class="table-title">Product List</div>
                <table class="user-product-list">
                    <thead>
                        <tr>
                            <th>상품명</th>
                            <th>상품번호</th>
                            <th>가격</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach items="${list }" var="s">
	                    <tbody>
	                        <tr>
	                            <td class="product-name">
	                            	${s.product_name }
	                            </td>
	                            <td>
	                                <div class="product-no">${s.product_no }</div>
	                            </td>
	                            <td class="total-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${s.product_price}" /> &#8361;</td>
	                            <td>

	                                <button class="modify-product modify" value="${s.product_no }">수정</button>
	                                <button class="delete-product delete" value="${s.product_no }">삭제</button>
	                            </td>
	                        </tr>
	                    </tbody>
                    </c:forEach>
                </table>
                <c:out value="${pageBar}" escapeXml="false"/>
            </div>
        </section>
    </div>
    
    <script>

	    $(function(){
			
			// 상품 수정 
			$(".modify").on("click",function(){
				var productNo = $(this).attr("value");
				console.log("productNo="+productNo);
				location.href = "${pageContext.request.contextPath}/product/productUpdateView.do?productNo="+productNo+"&pType=2";
				});
			
			// 상품 삭제
			$(".delete").on("click",function(){
				var productNo = $(this).attr("value");
				console.log("productNo="+productNo);
				location.href = "${pageContext.request.contextPath}/myPage/myPage_Product_Delete.mp?productNo="+productNo;
				});
			
			// $('.pagination_r').css('padding-left', '35%');
		});

    </script>
            
    <!-- FOOTER IMPORT -->
   	<%@ include file="../common/footer.jsp" %>
   	
</body>

</html>