<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <aside class="category-list">
		<div class="menu-title">MY PAGE</div>
		<ul class="category">
		    <li>
		        <a href="${pageContext.request.contextPath}/myPage/myPage_Brand_Info.mp" style="text-decoration: none; color: black;">회원 정보</a>
		    </li>
		    <li>
		        <a href="${pageContext.request.contextPath}/myPage/myPage_Brand_Product.mp" style="text-decoration: none; color: black;">등록 상품</a>
		    </li>
		    <li>
		        <a href="${pageContext.request.contextPath}/myPage/myPage_Brand_Order.mp" style="text-decoration: none; color: black;">주문 내역</a>
		    </li>
		    <li>
		        <a href="${pageContext.request.contextPath}/myPage/myPage_Brand_Rank.mp" style="text-decoration: none; color: black;">상품 순위</a>
		    </li>
		</ul>
	</aside>