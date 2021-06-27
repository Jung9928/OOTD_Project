<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>브랜드 - 상품리스트</title>
	    <script src="${pageContext.request.contextPath }/resources/asset/js/jquery-3.6.0.min.js"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage.css">
	    
	    <script>
		$(function(){
			$('.pagination_r').css('padding-left', '33%');
			
			// 상품 수정 
			$(".modify").on("click",function(){
				var productNo = $(this).attr("value");
				console.log("productNo="+productNo);
				location.href = "${pageContext.request.contextPath}/product/productUpdateView.do?productNo="+productNo+"&pType=1";
				});
			
			// 상품 삭제
			$(".delete").on("click",function(){
				var productNo = $(this).attr("value");
				console.log("productNo="+productNo);
				location.href = "${pageContext.request.contextPath}/myPage/myPage_Brand_Prodouct_Delete.mp?productNo="+productNo;
				});
		});
		
		// 상품 등록 버튼 클릭 시 실행
	    $(function() {		
			$('.registration').on('click', function() {				
				var pType = 1;
				location.href="${pageContext.request.contextPath}/product/productInputForm.do?pType="+pType;
			});
		});
	    </script>
	<c:import url="../common/styler.jsp"/>
	</head>
<body>

	<!-- HEADER IMPORT -->
	<c:import url="../common/header.jsp"/>

    <div class="container-myPage">
        <div class="body-title">MY PAGE</div>
       
        <!-- 좌측 aside 메뉴 (BRAND)1-->
        <%@ include file="myPage_Brand_Menu.jsp" %>
     
        <section class="main">
            <div class="wrap-section">
                <div class="table-title">Product List 
                	<button class="registration" style="font-size: 14px; left: 740px;">상품 등록하기</button>
                </div>
                <table class="product-list">
                    <thead>
                        <tr>
                            <th>상품명</th>
                            <th>상품번호</th>
                            <th>사이즈 - 재고</th>
                            <th>가격</th>
                            <th></th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="p"> 
                    <tbody>
                        <tr>
                            <td class="product-name">${p.product_name}</td>
                            <td>
                                <div class="product-no">${p.product_no}</div>
                            </td>
                            <td class="product-stock">
                                <div class="stock-area">                                    
                                    <span class="product-size">small</span>&nbsp;-
                                    <span class="product-stock">${p.product_stock_s}</span><br>
                                    <span class="product-size">medium</span>&nbsp;-
                                    <span class="product-stock">${p.product_stock_m}</span><br>
                                    <span class="product-size">large</span>&nbsp;-
                                    <span class="product-stock">${p.product_stock_l}</span>
                                </div>
                            </td>
                            <td class="total-price">${p.product_price} &#8361;</td>
                            <td>
                                <button class="modify-product modify" value="${p.product_no}">수정</button>
                                <button class="delete-product delete" value="${p.product_no}">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
                <c:out value="${pageBar}" escapeXml="false"/>
            </div>
        </section>
    </div>
        
    <!-- FOOTER IMPORT -->
   	<%@ include file="../common/footer.jsp" %>
   	
</body>

</html>