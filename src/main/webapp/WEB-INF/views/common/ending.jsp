<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>Ending</title>
   
    <c:import url="../common/styler.jsp"/>
     <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src='${pageContext.request.contextPath }/resources/js/jquery.zoom.js'></script>
    <script src='${pageContext.request.contextPath }/resources/js/jquery.Wheelzoom.js'></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productDetail.css" />
</head>
<body>
	<c:import url="../common/header.jsp"/>

<section>
<h1 style="margin-top: 100px; text-align: center;">Ending</h1>
    <div class="product_detail">
        <div class="package" >
            <div id="insertArea" class="inputBox1">
            	<!-- 박건형 -->
            	<div id="contentImgArea1" class="imgInput">
	                    <img src="${pageContext.request.contextPath}/resources/images/Easter Egg.jpg" 
	                        id="contentImg1" style="height: 150px; width: 120px;"/>
                </div>
                <!-- 엄기원 -->
                <div id="contentImgArea2" class="imgInput">
	                    <img src="${pageContext.request.contextPath}/resources/images/killberos.png" 
	                        id="contentImg2" style="height: 150px; width: 120px;"/>
                </div>
                <!-- 박다인 -->
                <div id="contentImgArea3" class="imgInput">
	                    <img src="${pageContext.request.contextPath}/resources/images/dark Egg.jpg" 
	                        id="contentImg3" style="height: 150px; width: 120px;"/>
                </div>
                <!-- 김현진 -->
                <div id="contentImgArea4" class="imgInput">
	                    <img src="${pageContext.request.contextPath}/resources/images/sample logo 3.jpg" 
	                        id="contentImg4" style="height: 150px; width: 120px;"/>
                </div>
                <!-- 홍정완 -->
                <div id="contentImgArea5" class="imgInput">
	                    <img src="${pageContext.request.contextPath}/resources/images/sample logo 4.jpg" 
	                        id="contentImg5" style="height: 150px; width: 120px;"/>
                </div>
                <!-- 김황석 -->
                <div id="contentImgArea6" class="imgInput" style="margin-bottom: 100px;">
	                    <img src="${pageContext.request.contextPath}/resources/images/sample logo 0.jpg" 
	                        id="contentImg6" style="height: 150px; width: 120px;"/>
                </div>
            </div>

            <div id="imgDetail" class="inputBox2">
                <div class='inputBox2 zoom' id='ex1'>
                    <img src='${pageContext.request.contextPath }/resources/images/productImgUpload/Easter Egg.jpg' id='jack' width='540' height='720' />
                </div>
            </div>
        
            
        </div>
        <div class="package">
            <div id="prTextInput" class="inputBox3">
                <span id="brand_name"><b>OOTD</b></span>
                <br>
                
                <h4 id="pName">Clothes for Tomorrow</h4>
                <span style="margin-left: 180px;" >￦</span><span id="ppPrice">9999999999999</span> <br><hr>
                
                <dl>
                    <dt class="drop"><b>팀 원</b> 
                        <span class="accIcon" style="float: right; margin-right: 30px;"> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                <path d="M0 8a1 1 0 0 1 1-1h14a1 1 0 1 1 0 2H1a1 1 0 0 1-1-1z"/>
                            </svg>
                        </span>
                    </dt> 
                    <dd class="ddd"><span class="pInfoText">
                    <br /><br />
                        박건형 , 엄기원 <br /><br /> 
                        
                        박다인 , 김현진 <br /><br />
                        
                        홍정완 , 김황석 <br />
                    </span> <br></dd>
                    <hr>
                    <dt class="drop"><b>마지막 한마디</b> 
                        <span class="accIcon" style="float: right; margin-right: 30px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                <path d="M0 8a1 1 0 0 1 1-1h14a1 1 0 1 1 0 2H1a1 1 0 0 1-1-1z"/>
                            </svg>
                        </span>
                    </dt>
                    <dd class="ddd"><span class="pInfoText">
                     <br /><br />
                        박건형 :  음.... 저는 다인님이 새벽마다 고의로 제 코드지우시는 부분이 너무 힘들었어요...<br /> <br />
                        엄기원 :  ㅜㅜ <br /><br />
                        박다인 :  건형님? 저는 건형님의 코드를 건든적이 없는데요ㅡㅡ<br /><br />
                        홍정완 :  스프링 쓰지 마세요. 장고 쓰세요.  <br /><br />
                        김황석 :  그동안 즐거웠고..<br /><br />
                        김현진 :  죽겠어요^^ <br />
                    </span> <br></dd>
                    <hr>
                    <dt>
                        <b>마무리</b>
                        <select name="" id="selectSize" class="selectSize" style="width: 140px; float: right; margin-right: 30px;" >
                            <option value="">선택</option>
                           	<option value="모두">1</option>
                           	<option value="고생했어요">2</option>
                           	<option value="Good luck">3</option>
                        </select> <br>
                    </dt><hr>
                    <dt class="pOrigin">
                        <div id="origin" class="selectedPList">
                       		<input type="hidden" class="product_no" value="${product.product_no }"/>
                       		<input type="hidden" class="product_type" value="${product.product_type }"/>
                            <span>${ product.product_name }<b class="selectedSize"></b> </span>
                            <input type="number" class="quantity" id="pQuan" name="pQuan" value="1" min="1"> <!-- input value 값 ??  -->
                            <img src="${pageContext.request.contextPath }/resources/images/xx.png" alt="" style="width: 15px; height: 15px; margin-right: 5px;" id="pDelete">
                            <input type="hidden" class="selSize" />
                        </div>
                    </dt>
                    <dt class="pResult">
                    </dt>

                </dl>

                <button class="btn" id="finish">Finish</button>

            </div>
        </div>
    </div>

</section>

<c:import url="../common/footer.jsp"/>
    
	<script>
		$("#finish").on("click",function(){
			location.href = "${pageContext.request.contextPath}/";
		});
		
	
		$(function() {
		    $(document).ready(function(){
		        $('#ex1').zoom();
		      
		    });
		});
    
    	
        
        $('#pDelete').on('click', function() {
            $(this).parent().remove()
        });
            
        $('#pQuan').on('change', function() {
            var uuu = $(this).val()
            
            // var ggg = $('#ppPrice').text().str.substring(indexStart[2, indexEnd])
            // var ggg = $('#ppPrice').text()
            // console.log(uuu);
            // console.log(ggg);
            // console.log(uuu*hhh);
            $(this).siblings('.pPrice').text(thousandComma(uuu*hhh));
            totalCalc();
        });
        var hhh;
        $(function() {
            hhh = $('#ppPrice').text();
            // console.log(hhh);
            $('#ppPrice').text(thousandComma($('#ppPrice').text()));
            if($("#pQuan").val() < 1) alert("최소 주문수량은 1개 입니다.");
        });
        $('.pOrigin').hide();
        // $('.pResult').hide();
        
        $('#selectSize').on('change', function() {
            $('.pResult').show();
            if($('.frmSize.'+$('#selectSize').val()).length == 0){
                var result = $('#origin').clone(true);
                result.removeClass('#origin');
                result.addClass($('#selectSize').val());
                result.addClass('frmSize');
                result.find('.selectedSize').text($('#selectSize').val());
                result.find('.selSize').val($('#selectSize').val());
                
                $('.pResult').append(result);
                $('.pPrice').each(function(){
                    $(this).text(thousandComma($(this).text()));
                });
            } else {
                var quan = $('.frmSize.'+$('#selectSize').val()).find('[name=pQuan]');
                quan.val(parseInt(quan.val()) + 1);
                var priceTag = quan.siblings('.pPrice');
                priceTag.text(thousandComma(parseInt((priceTag.text()).replace(',','')) * quan.val()));
            }
            totalCalc();
            $('#won').text('￦')
            // $('.pResult').$('#selectedSize').text($('#selectSize').val())
        })
        
        
       function totalCalc(){
            var totalPrice = 0;
            // console.log("totalPrice before :: " + totalPrice);
            
            $('.pResult .pPrice').each(function(){
                // console.log("parse : "+$(this).text());
                // console.log("count = " + Number(($(this).text()).replace(/,/gm,'')))
                totalPrice += Number(($(this).text()).replace(/,/gm,''));
            })
            
            // var totalQuan = 0;
            // $('.pResult #pQuan').each(function() {
            //     totalQuan += Number($('#pQuan').val())
            //     $('#totalQ').text("(" + totalQuan + "개)")
            // })
            $('.totalPD').text(thousandComma(totalPrice));
            // console.log("totalPrice after :: " + totalPrice);
       }
        
        function thousandComma(x){
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        $('.drop').on('click', function () {
        	$(this).next('.ddd').slideToggle(300);
        	
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
            // if ($(this).hasClass('on')) {
            //     slideUp();
            // } else {
            //     slideUp();
            //     $(this).addClass('on').next().slideDown();
            // }
            // function slideUp() {
            //     $('.drop').removeClass('on').next().slideUp();
            // };
        });
        $(function() {
        	$('#imgDetail').children().children().attr('src', $('#contentImg1').attr('src'));
        });
        $('#contentImgArea1').on('click', function() { 
			$('#imgDetail').children().children().attr('src', $('#contentImg1').attr('src'));
		});
		
		$('#contentImgArea2').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg2').attr('src'));
		});
		
		$('#contentImgArea3').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg3').attr('src'));
		});
		
		$('#contentImgArea4').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg4').attr('src'));
		});
		$('#contentImgArea5').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg5').attr('src'));
		});
		$('#contentImgArea6').on('click', function() {
			$('#imgDetail').children().children().attr('src', $('#contentImg6').attr('src'));
		});
		
		
		// icon, review-content toggle
		$('.showArea, .showArea-faq').on('click', function() {
			$(this).next('.dropArea').slideToggle(300);
            // +, - 아이콘 바꾸기
            var plus = $(this).children('.icon-td').children('span').children('.bi-plus-lg');
            var dash = $(this).children('.icon-td').children('span').children('.bi-dash-lg');
			
            console.log(plus);
            console.log(dash);
            
            if ( dash.css('display') == 'none' ) {
                dash.css('display', 'block');
                plus.css('display', 'none');
            } else {
                plus.css('display', 'block');
                dash.css('display', 'none');
            }
        });
		
		// REVIEW 클릭 시 리뷰 테이블만 보이기
		$('.review').on('click', function() {
			$('#FAQ-table').css('display', 'none');
			$('#review-table').css('display', 'block');
			$(this).css('color', 'black');
			$(this).css({
				color: 'black',
				'text-decoration': 'underline'
			});
			$(this).siblings('.faq').css({
				color: 'grey',
				'text-decoration': 'none'
			});
		});
		
		// FAQ 클릭 시 FAQ 테이블만 보이기
		$('.faq').on('click', function() {
			$('#review-table').css('display', 'none');
			$('#FAQ-table').css('display', 'block');
			$(this).css({
				color: 'black',
				'text-decoration': 'underline'
			});
			$(this).siblings('.review').css({
				color: 'grey',
				'text-decoration': 'none'
			});
		});
		
		
		$(function() {
			
			var str = $('#currPage').text();
			// var index = str.indexOf('currPage');
			
			// var result = str.substring(index+11, index+12);
			console.log(str);
			
			if ( str > 1 ) {
				var offset = $(".review_list").offset();
	        	$('html, body').animate({scrollTop : offset.top}, 50);
			}
		});
			
	
			
		
		
		
	
		
		 
    </script>
</body>
</html>