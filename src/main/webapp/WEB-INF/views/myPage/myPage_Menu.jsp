<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
     <aside class="category-list">
            <div class="menu-title">MY PAGE</div>
            <ul class="category">
                <li>
                    <a href="${pageContext.request.contextPath}/myPage/myPage_Info.mp" class="myPageInfo">회원 정보</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/myPage/myPage_Purchased.mp" class="myPageInfo">구매 내역</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/myPage/myPage_Product.mp" class="myPageInfo">판매 상품</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/myPage/myPage_Sale.mp" class="myPageInfo">판매 내역</a>
                </li>
            </ul>
        </aside>