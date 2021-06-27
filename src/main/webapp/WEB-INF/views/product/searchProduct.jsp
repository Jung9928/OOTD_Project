<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.ootd.ootdApp.product.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고리스트</title>
<c:import url="../common/styler.jsp"/>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productList.css">
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
    <div class="container-List">
        <!-- 스토어 이름영역 -->
        <header class="list-title">
            <h2 align="center">SEARCH PRODUCT</h2>
        </header>
        <!-- 카테고리 사이드바 -->
        <nav class="side-bar">
            <!-- 카테고리 -->
            <div id="category">
                
            </div>
        </nav>
        
        <section class="main-wrapper" style="justify-content: center; aligns-items: center;">
            <!-- 필터 정렬 영역 -->
            <div class="filter-div">
                <span class="filter-text">최신순</span>
                <span class="filter-text">낮은 가격순</span>
                <span class="filter-text">높은 가격순</span>
                <c:if test="${ member != null && member.login_type == 2 }">
               	 	<span class="filter-text" id="prod-regis" style="margin-left: 576px;">상품등록</span> 
                </c:if>
            </div>
            <div class="content-wrapper" >
                <!-- 상품 list -->
                <div class="product-list">
                	<c:forEach items="${ list }" var="p" varStatus="vs">
		            	<c:if test="${ vs.count%4 == 1 }">
		            		<ul>
		            	</c:if>
	                    <li class="thumbnail-list">
	                        <div class="thumbnail-area" id="${ p.product_no }">
	                            <!-- thumbnail image -->
	                            <img src="${pageContext.request.contextPath}/resources/images/productImgUpload/${p.att_name}" alt="">

	                            <!-- 상품 정보 (hover) -->
	                            <span class="p_attr thumbnail-info">
	                                <span>${ p.brand_name }</span> <br />
	                                <span>${ p.product_name }</span>
	                                     <br><br>
	                                <span>￦</span>
	                                <span class="pPrice">${ p.product_price }</span>
	                            </span>
	                        </div>
	                    </li>
	                    <c:if test="${ vs.count%4 == 0 || vs.count eq list.size() }">
		            		</ul>
		            	</c:if>
                    </c:forEach>
           		</div>
            	<!--
            	<div class="pagination">
	                <a href="#">&laquo;</a>
	                <a href="#">1</a>
	                <a href="#">2</a>
	                <a href="#">3</a>
	                <a href="#">4</a>
	                <a href="#">5</a>
	                <a href="#">6</a>
	                <a href="#">&raquo;</a>
              	</div> -->
              	<c:out value="${pageBar}" escapeXml="false"/>
            </div>
            
        </section>
        
                <!-- top 버튼 -->
	        <aside>
	            <div id="topBtn" href="#">TOP</div>
	        </aside>
    </div>
	
    <!-- FOOTER IMPORT -->
   	<%@ include file="../common/footer.jsp" %>
   	
	
    <script>
    
    var sortVal; // 정렬필터값 
	var pType;
	var categoryNo;
	
 	
 	
 	
	 	function thousandComma(x){
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
	    
    
    
    
    
    
	    // 상품 등록 버튼 클릭 시 실행
	    $(function() {		
			$('#prod-regis').on('click', function() {
				
				var pType = 2;
				location.href="${pageContext.request.contextPath}/product/productInputForm.do?pType="+pType;
			});
		});
	    
	    
		 // click 시 ProductDetail 이동
		$(function(){
			$('.thumbnail-area').on("click",function(){
				var product_no = $(this).attr("id");
				console.log("product_no="+product_no);
				location.href = "${pageContext.request.contextPath}/product/productDetail.do?product_no="+product_no+"&pType=2";
			});
		});
    
    
		 
    
        // Dropdown 
        $('.showArea').on('click', function() {
            // 숨긴 영역 slide down
            $(this).next('.dropArea').slideToggle(300);
            // +, - 아이콘 바꾸기
            var plus = $(this).children('span').children('.bi-plus-lg');
            var dash = $(this).children('span').children('.bi-dash-lg');
            if ( dash.css('display') == 'none' ) {
                dash.css('display', 'inline-block');
                plus.css('display', 'none');
            } else {
                plus.css('display', 'inline-block');
                dash.css('display', 'none');
            }
        });
        // hover 시 상품정보 보여주기
        $('.thumbnail-area').on({
                'mouseenter' : function() {
                    $(this).children('span').css('display', 'block');
                }, 
                'mouseleave' : function() {
                    $(this).children('span').css('display', 'none');
                }
        });
    	
        // filter 클릭 시 밑줄 표기하기
        $('.filter-text').on('click', function() {
            $(this).css('border-bottom', 'solid 2px gray');
            $(this).siblings().css('border-bottom', '');
        });
        // top 버튼
        $(function() {
        $("#topBtn").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
        
    $('#toggleTheme').on('click', function() {
        $('html').toggleClass("dark");
    });
    $(function() {
        console.log(localStorage.getItem('darkMode'));
        $('html').attr('class', localStorage.getItem('darkMode'));
    });
        
    </script>
</body>
</html>