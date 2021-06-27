<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../member/loginModal.jsp"%>


	<header class="header">
		<div class="header_nav">
			<!-- HEADER 로고 클릭 시 index화면으로 이동 -->
			<div class="header_logo">
				<img
					src="${pageContext.request.contextPath }/resources/images/headerlogo.png"
					id="logo" />
			</div>

			<!-- Header Brand, Second Hands (클릭 시 하단에 메뉴바) -->
			<div class="header_menu">
				<div>
					<h3 id="brand">BRAND</h3>
				</div>
				<div>
					<h3 id="second_Hand">SECOND HAND</h3>
				</div>
			</div>

			<!-- 검색창, 장바구니, 마이페이지, 다크모드 -->
			<div class="header_option">
				<ul class="nav_menu">
					<li class="search_li">
						<div>

							<form action="/header/totalSearch.do" method="POST" id="search_main">
								<input type="text" class="search_input" name="totalSearch"><i class="fas fa-search fa-lg"></i>
							</form>
						</div>

					</li>

					<li><i class="fas fa-shopping-cart fa-lg" id="cartIcon"></i></li>

					<li><i class="fas fa-user fa-lg" id="loginBtn"
						data-target="#loginModal" data-toggle="modal" href="${contextContext.request.contextPage }/views/myPage/myPage_Info.jsp"></i></li>
					<li>
						<span class="fa-stack fa-lg"> 
							<i class="far fa-sun fa-stack-1x fa-lg"></i> 
							<i class ="far fa-moon fa-stack-1xfa-lg"></i>
						</span>
					</li>

				</ul>


			</div>
		</div>
	</header>




	<script>
	
	$(function() {		
		$('#brand').on('click', function() {
			
			var pType = 1;
			location.href="${pageContext.request.contextPath}/product/productList.do?pType="+pType;
		});
	});
	
	$(function() {		
		$('#second_Hand').on('click', function() {
			
			var pType = 2;
			location.href="${pageContext.request.contextPath}/product/productList.do?pType="+pType;
		});
	});
	
	
	
	
	
		$(function() {

			var icon = document.getElementById("logo");
			var icon_footer = document.getElementById("logo_footer")
			
			$('ul').children('li').find('.fa-search').click(function() {
				if ($('.search_input').val() != "") { 
					location.href="${pageContext.request.contextPath}/header/totalSearch.do?totalSearch=" + $('.search_input').val();
				} else if($('.search_input').val() == "") {
					alert("원하시는 상품명 또는 브랜드명을 입력해주세요.");
					$('#search_main').attr('disabled');
				}
			})

			//  $('ul').children('li').find('.fa-user').click(function() {
			//       alert("로그인 되있으면 마이페이지 안되있으면 로그인 페이지");
			//  })
			
			$('.fa-moon').on('click', function() {
				
				$('html').toggleClass("dark");
		        var mode = $('html').attr('class');
		        localStorage.setItem('darkMode', mode)
		        
		        $('.search_input').css('background-color','black');
				$('.search_input').css('color', 'white');
				$('.myPageInfo').css('text-decoration', 'none');
				$('.myPageInfo').css('color', '#bbb');
				$('.bx-wrapper').css('background-color', 'black');
				
				icon.src = "${pageContext.request.contextPath }/resources/images/headerdarklogo.png";
				icon_footer.src = "${pageContext.request.contextPath }/resources/images/footerdarklogo.jpeg";
				
				$('.fa-moon').hide();
				$('.fa-sun').css('visibility', 'visible');
		        
			});

							

			$('.fa-sun').on('click', function() {
				$('html').toggleClass("dark");
		        var mode = $('html').attr('class');
		        localStorage.setItem('darkMode', mode);
		        
		        $('.search_input').css('background-color','white');
				$('.search_input').css('color', '#bbb');
				$('.myPageInfo').css('text-decoration', 'none');
				$('.myPageInfo').css('color', 'black');
				$('.bx-wrapper').css('background-color', 'white');

				icon.src = "${pageContext.request.contextPath }/resources/images/headerlogo.png";
				icon_footer.src = "${pageContext.request.contextPath }/resources/images/footerlogo.png";
				
				$('.fa-sun').css('visibility', 'hidden');
				$('.fa-moon').show();
		        
			});

			$('.header_logo').on('click', function() {

				location.href="${pageContext.request.contextPath }/";

			})

		});
		
	// 카트 아이콘 클릭시 장바구니 이동
	$(".fa-shopping-cart").click(function(){
		if(${empty member}){
			alert("회원 전용 기능입니다.")
		}else{
			location.href = "${pageContext.request.contextPath}/order/cart.or";
		}
	});
	
	// localStorage에 담긴 darkMode 여부에 따라서 html 에 class 주기
	$(function() {
		
		var icon = document.getElementById("logo");
		var icon_footer = document.getElementById("logo_footer")
		
        console.log(localStorage.getItem('darkMode'));
        $('html').attr('class', localStorage.getItem('darkMode'));
        
        if( $('html').attr('class') == 'dark' ) {
        	
        	$('.search_input').css('background-color','black');
			$('.search_input').css('color', 'white');

			icon.src = "${pageContext.request.contextPath }/resources/images/headerdarklogo.png";
			icon_footer.src = "${pageContext.request.contextPath }/resources/images/footerdarklogo.jpeg";
			
			$('.fa-moon').hide();
			$('.fa-sun').css('visibility', 'visible');
        	
        } else {
        	
        	$('.search_input').css('background-color','white');
			$('.search_input').css('color', '#bbb');

			icon.src = "${pageContext.request.contextPath }/resources/images/headerlogo.png";
			icon_footer.src = "${pageContext.request.contextPath }/resources/images/footerlogo.png";
			$('.fa-sun').css('visibility', 'hidden');
			$('.fa-moon').show();
        	
        }
        
    });
	
	
	</script>

