
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

	<head>
	    <meta charset="UTF-8">
	    <title>브랜드 - 상품 순위</title>
	    <script src="${pageContext.request.contextPath }/resources/asset/js/jquery-3.6.0.min.js"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPage.css">
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
                <div class="table-title">Product Rank</div>
                <table class="product-rank">
                    <thead>
                        <tr>
                            <th>순위</th>
                            <th>상품명</th>
                            <th>상품번호</th>
                            <th>가격</th>
                            <th>누적 판매수량</th>
                            <th>누적 판매금액</th>
                        </tr>
                    </thead>
                    <c:forEach items="${list}" var="p">    
                    <tbody>
                        <tr>
                            <td>
                                <div class="rank">${p.rank}</div>
                            </td>
                            <td>
                                <div class="product-info">
                                    <span class="product-name">${p.product_name}</span>
                                </div>
                            </td>
                            <td>
                                <div class="product-no">${p.product_no}</div>
                            </td>
                            <td class="product-price">${p.product_price}&nbsp;&#8361;</td>
                            <td>
                                <div class="sold">${p.quantity}</div>
                            </td>
                            <td>
                                <div class="sold-price">${p.total}&nbsp;&#8361;</div>
                            </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
            </div>
        </section>
    </div>
    
    <!-- FOOTER IMPORT -->
   	<%@ include file="../common/footer.jsp" %>
   	
</body>

</html>